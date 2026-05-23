#!/usr/bin/env bash
#
# check-matrix.sh
# ----------------
# Compile thesis/main.typ for every important combination of:
#   thesis_type : bachelor | master | phd
#   language    : ro | en
#   department  : cti | acse | aii
#
# Configuration is passed via `typst --input key=value`, so config.typ is
# NEVER modified on disk. Each PDF is written to build/matrix/.
#
# Exit code:
#   0  -> all combinations compiled successfully
#   1  -> at least one combination failed
#
# Usage:
#   ./scripts/check-matrix.sh
#
set -uo pipefail

# Resolve repo root (this script lives in <root>/scripts/).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${ROOT_DIR}"

TYPST="${TYPST:-typst}"
OUT_DIR="build/matrix"
mkdir -p "${OUT_DIR}"

THESIS_TYPES=(bachelor master phd)
LANGUAGES=(ro en)
DEPARTMENTS=(cti acse aii)

fail=0
total=0
ok=0

echo "Compiling thesis matrix (config.typ is left untouched)..."
echo

for tt in "${THESIS_TYPES[@]}"; do
  for lang in "${LANGUAGES[@]}"; do
    for dep in "${DEPARTMENTS[@]}"; do
      total=$((total + 1))
      name="thesis_${tt}_${lang}_${dep}"
      out="${OUT_DIR}/${name}.pdf"
      log="$("${TYPST}" compile \
            --root . \
            --input "thesis_type=${tt}" \
            --input "language=${lang}" \
            --input "department=${dep}" \
            thesis/main.typ "${out}" 2>&1)"
      status=$?
      if [ ${status} -eq 0 ]; then
        ok=$((ok + 1))
        printf "  [ OK ] %-28s -> %s\n" "${name}" "${out}"
      else
        fail=1
        printf "  [FAIL] %-28s\n" "${name}"
        echo "${log}" | sed 's/^/         /'
      fi
    done
  done
done

echo
echo "Matrix result: ${ok}/${total} combinations compiled."

if [ ${fail} -ne 0 ]; then
  echo "ERROR: at least one combination failed to compile." >&2
  exit 1
fi
echo "All combinations compiled successfully."
exit 0
