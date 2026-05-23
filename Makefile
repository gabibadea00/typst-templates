# ============================================================
#  Makefile — typst-templates
#  Instalare, build și testare pentru template-urile Typst.
#  Rulează `make help` pentru lista de comenzi.
# ============================================================

# Permite suprascrierea binarului typst: `make thesis TYPST=/cale/typst`
TYPST       ?= typst
BUILD_DIR   ?= build
ROOT        ?= .

# Override-uri opționale pentru config.
# Notă: folosim THESIS_LANG (nu LANG) ca să nu intre în conflict cu variabila
# de mediu LANG a shell-ului. Acceptăm și LANGUAGE/TYPE/DEPT ca scurtături.
THESIS_LANG ?=
TYPE        ?=
DEPT        ?=

# Construiește lista de --input doar pentru variabilele setate.
INPUTS :=
ifneq ($(THESIS_LANG),)
INPUTS += --input language=$(THESIS_LANG)
endif
ifneq ($(TYPE),)
INPUTS += --input thesis_type=$(TYPE)
endif
ifneq ($(DEPT),)
INPUTS += --input department=$(DEPT)
endif

# Detectare sistem de operare pentru target-ul `install`.
UNAME_S := $(shell uname -s)

.DEFAULT_GOAL := help

# ------------------------------------------------------------
.PHONY: help
help: ## Afișează această listă de comenzi
	@echo "typst-templates — comenzi disponibile:"
	@echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@echo
	@echo "Override config (opțional): make thesis THESIS_LANG=ro TYPE=master DEPT=acse"

# ------------------------------------------------------------
.PHONY: install
install: ## Instalează Typst + fonturile Liberation (apt/brew, cu fallback)
	@echo ">> Verific Typst..."
	@if command -v $(TYPST) >/dev/null 2>&1; then \
		echo "   Typst este deja instalat: $$($(TYPST) --version 2>/dev/null || echo ok)"; \
	else \
		echo "   Typst lipsește — încerc instalarea..."; \
		if [ "$(UNAME_S)" = "Darwin" ]; then \
			if command -v brew >/dev/null 2>&1; then brew install typst; \
			else echo "   ! Homebrew lipsește. Instalează de la https://brew.sh apoi: brew install typst"; fi; \
		elif [ "$(UNAME_S)" = "Linux" ]; then \
			if command -v snap >/dev/null 2>&1; then sudo snap install typst; \
			elif command -v cargo >/dev/null 2>&1; then cargo install --locked typst-cli; \
			else echo "   ! Nu pot instala automat. Vezi https://github.com/typst/typst#installation"; fi; \
		else \
			echo "   ! OS necunoscut ($(UNAME_S)). Vezi https://github.com/typst/typst#installation"; \
		fi; \
	fi
	@echo ">> Verific fonturile (Liberation = Times/Courier metric-compatibile)..."
	@if command -v fc-list >/dev/null 2>&1 && fc-list 2>/dev/null | grep -qi "Liberation Serif"; then \
		echo "   Fonturile Liberation sunt instalate."; \
	else \
		echo "   Fonturile Liberation lipsesc — încerc instalarea..."; \
		if [ "$(UNAME_S)" = "Darwin" ]; then \
			if command -v brew >/dev/null 2>&1; then brew install --cask font-liberation || true; \
			else echo "   ! Instalează manual fontul Liberation (Homebrew)."; fi; \
		elif [ "$(UNAME_S)" = "Linux" ]; then \
			if command -v apt-get >/dev/null 2>&1; then sudo apt-get update && sudo apt-get install -y fonts-liberation; \
			elif command -v dnf >/dev/null 2>&1; then sudo dnf install -y liberation-fonts; \
			elif command -v pacman >/dev/null 2>&1; then sudo pacman -S --noconfirm ttf-liberation; \
			else echo "   ! Instalează manual pachetul de fonturi Liberation."; fi; \
		fi; \
	fi
	@echo ">> Gata. Rulează 'make check' pentru verificare completă."

# ------------------------------------------------------------
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

.PHONY: thesis
thesis: | $(BUILD_DIR) ## Compilează lucrarea -> build/thesis.pdf
	$(TYPST) compile --root $(ROOT) $(INPUTS) thesis/main.typ $(BUILD_DIR)/thesis.pdf
	@echo "OK: $(BUILD_DIR)/thesis.pdf"

.PHONY: presentation
presentation: | $(BUILD_DIR) ## Compilează prezentarea -> build/presentation.pdf (prima dată descarcă pachete)
	$(TYPST) compile --root $(ROOT) $(INPUTS) thesis/presentation.typ $(BUILD_DIR)/presentation.pdf
	@echo "OK: $(BUILD_DIR)/presentation.pdf"

.PHONY: pdf
pdf: thesis presentation ## Compilează ambele PDF-uri

# ------------------------------------------------------------
.PHONY: matrix
matrix: ## Compilează toate combinațiile config (thesis_type × language × department)
	./scripts/check-matrix.sh

.PHONY: check
check: ## Rulează suita completă de verificare (thesis + matrix + presentation)
	./scripts/check-all.sh

# ------------------------------------------------------------
.PHONY: clean
clean: ## Șterge artefactele de build
	rm -rf $(BUILD_DIR)
	@echo "Curățat $(BUILD_DIR)/"
