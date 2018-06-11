all: unified-test.pdf

%.pdf: %.tex %.bib
	pdflatex $*
	biber $*
	pdflatex $*
