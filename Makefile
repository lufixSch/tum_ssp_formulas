# Minimal makefile for Latex protocol template
#

# You can set these variables from the command line, and also
# from the environment.
OUTDIR      	?= build
DOC						?= formula_collection
PDF						?= FormulaCollection

# Put it first so that "make" without argument is like "make help".
help:


.PHONY: help Makefile

# create PDF with xelatex
pdf:
	@xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=$(OUTDIR) $(DOC).tex

# clean buildfolder and create pdf
clean:
	@rm -R ./build
	@mkdir ./build
	@make pdf

# package pdf and source files
pkg:
# run twice to get references right
	@make pdf
	@make pdf
# copy pdf to root
	@cp ./build/$(DOC).pdf ./$(PDF).pdf