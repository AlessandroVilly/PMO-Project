@echo off
setlocal

:: ==========================================
:: SCRIPT WINDOWS PER LUALATEX
:: ==========================================

set "DOC=Relazione"
set "AUX_DIR=build"

:: Esportazione della variabile TEXINPUTS per includere i pacchetti locali
set "TEXINPUTS=./packages//;%TEXINPUTS%"

:: Flag comuni per latexmk e LuaLaTeX
set "LATEXMK_FLAGS=-lualatex -auxdir=%AUX_DIR% -outdir=. -emulate-aux-dir -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape"

:: Gestione dei target (default: all)
if "%~1"=="" goto :all
if /I "%~1"=="all" goto :all
if /I "%~1"=="watch" goto :watch
if /I "%~1"=="clean" goto :clean

echo Target non riconosciuto: %~1
echo Uso: %~nx0 [all^|watch^|clean]
exit /b 1

:all
latexmk %LATEXMK_FLAGS% "%DOC%.tex"
goto :eof

:watch
latexmk %LATEXMK_FLAGS% -pvc "%DOC%.tex"
goto :eof

:clean
latexmk -C -auxdir=%AUX_DIR% -outdir=. "%DOC%.tex"
if exist "%AUX_DIR%" rmdir /S /Q "%AUX_DIR%"
if exist "%DOC%.pdf" del /Q "%DOC%.pdf"
if exist "%DOC%.synctex.gz" del /Q "%DOC%.synctex.gz"
goto :eof