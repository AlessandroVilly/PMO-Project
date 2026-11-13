# ==========================================
# MAKEFILE CROSS-PLATFORM PER LUALATEX
# ==========================================

# Nome del file principale (senza l'estensione .tex)
DOC = Relazione

# Configurazione dipendente dal Sistema Operativo
ifeq ($(OS),Windows_NT)
    # Impostazioni per Windows
    SEP = ;
    COPY_CMD = copy aux\$(DOC).pdf $(DOC).pdf >nul
    CLEAN_CMD = if exist aux rmdir /S /Q aux & if exist $(DOC).pdf del /Q $(DOC).pdf
else
    # Impostazioni per Linux/macOS
    SEP = :
    COPY_CMD = cp aux/$(DOC).pdf $(DOC).pdf
    CLEAN_CMD = rm -rf aux $(DOC).pdf
endif

# Esportazione della variabile TEXINPUTS per includere i pacchetti locali
export TEXINPUTS := ./packages//$(SEP)$(TEXINPUTS)

# Comando e flag base per il motore di compilazione
LUALATEX_CMD = lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape

.PHONY: all watch clean

# Target principale: compilazione standard singola
all:
	latexmk -pdf -pdflatex="$(LUALATEX_CMD) %O %S" -outdir=aux $(DOC).tex
	$(COPY_CMD)

# Target watch: emula il comportamento -pvc per l'anteprima continua
watch:
	latexmk -pdf -pdflatex="$(LUALATEX_CMD) %O %S" -outdir=aux -pvc $(DOC).tex

# Target clean: rimozione della cartella ausiliaria e dei risultati
clean:
	latexmk -C -outdir=aux $(DOC).tex
	$(CLEAN_CMD)
