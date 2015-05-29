# specify your main target here:
all: book pod cover

# specify thh main file and all the files that you are including
SOURCE= lsp-skeleton.tex chapters/01.tex chapters/02.tex chapters/03.tex\
localbibliography.bib\
LSP/langsci.cls
	 
lsp-skeleton.pdf: lsp-skeleton.tex $(SOURCE)
	xelatex -no-pdf lsp-skeleton 
	bibtex -min-crossrefs=200 lsp-skeleton
	xelatex  -no-pdf lsp-skeleton
	sed -i s/.*\\emph.*// lsp-skeleton.adx #remove titles which biblatex puts into the name index
	makeindex -o lsp-skeleton.and lsp-skeleton.adx
	makeindex -o lsp-skeleton.lnd lsp-skeleton.ldx
	makeindex -o lsp-skeleton.snd lsp-skeleton.sdx
	xelatex -no-pdf lsp-skeleton 
	xelatex lsp-skeleton 

#create only the book
book: lsp-skeleton.pdf 

#create a png of the cover
cover: lsp-skeleton.pdf
	convert lsp-skeleton.pdf\[0\] -quality 100 -background white -alpha remove -bordercolor black -border 2  cover.png
	display cover.png

#extract the front cover, back cover and spine from the pdf	
triptychon: lsp-skeleton.pdf#output=long has to be used for this to work
	pdftk A=lsp-skeleton.pdf cat  A1  output front.pdf 
	pdftk A=lsp-skeleton.pdf cat A2 output back.pdf 
	pdftk A=lsp-skeleton.pdf cat A3 output spine.pdf

#prepare for print on demand services	
pod: bod createspace

#prepare for submission to BOD
bod: triptychon #output=long has to be used for this to work
	pdftk A=lsp-skeleton.pdf B=blank.pdf cat B A4-end output tmp.pdf 
	./filluppages tmp.pdf bod/bodcontent.pdf
	\rm tmp.pdf
	xelatex bodcover.tex
	mv bodcover.pdf bod/

# prepare for submission to createspace
createspace: triptychon #output=long has to be used for this to work
	xelatex createspacecover.tex
	mv createspacecover.pdf createspace
	pdftk A=lsp-skeleton.pdf B=blank.pdf cat B A4-end output createspace/createspacecontent.pdf

#housekeeping	
clean:
	rm -f *.bak *~ *.backup *.tmp \
	*.adx *.and *.idx *.ind *.ldx *.lnd *.sdx *.snd *.rdx *.rnd *.wdx *.wnd \
	*.log *.blg *.ilg \
	*.aux *.toc *.cut *.out *.tpm *.bbl *-blx.bib *_tmp.bib \
	*.glg *.glo *.gls *.wrd *.wdv *.xdv \
	*.run.xml \
	chapters/*aux chapters/*backup chapters/*~

realclean: clean
	rm -f *.dvi *.ps *.pdf 
