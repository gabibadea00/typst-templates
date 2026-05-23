#!/usr/bin/env bash
#
# transcribe-videos.sh
# --------------------
# Transcribe the videos in videos/ into Markdown transcripts under
# docs/thesis-writing-guidance/transcripts/.
#
# This script is intentionally portable: it picks the first available local
# transcription backend, in this order:
#   1. faster-whisper  (Python package, run via scripts/_transcribe_fw.py)
#   2. whisper         (OpenAI Whisper CLI)
#   3. whisper.cpp     (the `whisper-cpp` / `main` binary + a GGML model)
#
# Requirements:
#   - ffmpeg (to extract 16 kHz mono WAV audio)
#   - one of the backends above
#
# Environment variables:
#   WHISPER_MODEL   model size/name (default: "small"; e.g. base, small, medium)
#   WHISPER_LANG    language hint (default: "ro")
#   VIDEO_DIR       input directory (default: videos)
#   OUT_DIR         output directory (default: docs/thesis-writing-guidance/transcripts)
#
# Usage:
#   ./scripts/transcribe-videos.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${ROOT_DIR}"

VIDEO_DIR="${VIDEO_DIR:-videos}"
OUT_DIR="${OUT_DIR:-docs/thesis-writing-guidance/transcripts}"
WHISPER_MODEL="${WHISPER_MODEL:-small}"
WHISPER_LANG="${WHISPER_LANG:-ro}"

command -v ffmpeg >/dev/null 2>&1 || { echo "ERROR: ffmpeg is required" >&2; exit 1; }

if [ ! -d "${VIDEO_DIR}" ]; then
  echo "ERROR: video directory '${VIDEO_DIR}' not found." >&2
  echo "Place your .mkv/.mp4/.mov files there and re-run." >&2
  exit 1
fi

mkdir -p "${OUT_DIR}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

# Pick a backend.
backend=""
if python3 -c "import faster_whisper" >/dev/null 2>&1; then
  backend="faster-whisper"
elif command -v whisper >/dev/null 2>&1; then
  backend="whisper"
elif command -v whisper-cpp >/dev/null 2>&1 || command -v main >/dev/null 2>&1; then
  backend="whisper.cpp"
else
  echo "ERROR: no transcription backend found (faster-whisper / whisper / whisper.cpp)." >&2
  exit 1
fi
echo "Using backend: ${backend}"

shopt -s nullglob
videos=( "${VIDEO_DIR}"/*.mkv "${VIDEO_DIR}"/*.mp4 "${VIDEO_DIR}"/*.mov "${VIDEO_DIR}"/*.webm )
if [ ${#videos[@]} -eq 0 ]; then
  echo "ERROR: no video files found in ${VIDEO_DIR}" >&2
  exit 1
fi

i=0
for v in "${videos[@]}"; do
  i=$((i + 1))
  base="video-${i}"
  wav="${TMP_DIR}/${base}.wav"
  out_md="${OUT_DIR}/${base}-transcript.md"
  echo ">> [$i] ${v}"
  echo "   extracting audio..."
  ffmpeg -y -i "${v}" -ac 1 -ar 16000 -vn "${wav}" >/dev/null 2>&1

  case "${backend}" in
    faster-whisper)
      python3 "${SCRIPT_DIR}/_transcribe_fw.py" \
        --audio "${wav}" --out "${out_md}" \
        --model "${WHISPER_MODEL}" --lang "${WHISPER_LANG}" \
        --source "$(basename "${v}")"
      ;;
    whisper)
      whisper "${wav}" --model "${WHISPER_MODEL}" --language "${WHISPER_LANG}" \
        --output_format txt --output_dir "${TMP_DIR}" >/dev/null
      {
        echo "# Transcript: $(basename "${v}")"
        echo
        cat "${TMP_DIR}/${base}.txt"
      } > "${out_md}"
      ;;
    whisper.cpp)
      bin="$(command -v whisper-cpp || command -v main)"
      "${bin}" -m "${WHISPER_MODEL}" -l "${WHISPER_LANG}" -f "${wav}" -otxt -of "${TMP_DIR}/${base}" >/dev/null
      {
        echo "# Transcript: $(basename "${v}")"
        echo
        cat "${TMP_DIR}/${base}.txt"
      } > "${out_md}"
      ;;
  esac
  echo "   -> ${out_md}"
done

echo "Done. Transcripts written to ${OUT_DIR}/"
