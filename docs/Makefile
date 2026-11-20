# ==========================================
# MAKEFILE CROSS-PLATFORM PER LUALATEX
# ==========================================

# Nome del file principale (senza l'estensione .tex)
DOC = Relazione
AUX_DIR = build

# Configurazione dipendente dal Sistema Operativo
ifeq ($(OS),Windows_NT)
    SEP = ;
    CLEAN_CMD = if exist $(AUX_DIR) rmdir /S /Q $(AUX_DIR) & if exist $(DOC).pdf del /Q $(DOC).pdf & if exist $(DOC).synctex.gz del /Q $(DOC).synctex.gz
else
    SEP = :
    CLEAN_CMD = rm -rf $(AUX_DIR) $(DOC).pdf $(DOC).synctex.gz
endif

# Esportazione della variabile TEXINPUTS per includere i pacchetti locali
export TEXINPUTS := ./packages//$(SEP)$(TEXINPUTS)

# Flag comuni per latexmk e LuaLaTeX
LATEXMK_FLAGS = -lualatex \
                -auxdir=$(AUX_DIR) \
                -outdir=. \
                -emulate-aux-dir \
                -synctex=1 \
                -interaction=nonstopmode \
                -file-line-error \
                -shell-escape

.PHONY: all watch clean

# Target principale: compilazione standard singola
all:
	latexmk $(LATEXMK_FLAGS) $(DOC).tex

# Target watch: compilazione continua con aggiornamento diretto del PDF nella root
watch:
	latexmk $(LATEXMK_FLAGS) -pvc $(DOC).tex

# Target clean: rimozione della cartella ausiliaria e dei risultati
clean:
	latexmk -C -auxdir=$(AUX_DIR) -outdir=. $(DOC).tex
	$(CLEAN_CMD)
