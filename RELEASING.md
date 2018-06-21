# The Unicode Cookbook for Linguists

Steven Moran \<bambooforest@gmail.com\> & Michael Cysouw \<cysouw@mac.com\>


## How to typeset the book

For those interested, the book is typeset with XeLaTeX using the [https://github.com/langsci](Language Science Press) LaTeX template. We extended this template with knitr-based R-code, so that we could include Python and R code examples. The R markdown file has to be processed first (see below) and it generates the LaTeX code in `main.tex`, which can then be typeset using XeLaTeX and BibTeX.

The knitr setup is included in the file `main.Rnw`. To process this file, the following R-packages need to be installed (e.g. `install.packages("knitr")`):

- knitr
- highlight
- highr
- xtable
- formatR
- qlcData


Note that the package `qlcData` will probably need the newest version from Github, to be installed within R by using:

     install.packages("devtools")
     devtools::install_github("cysouw/qlcData", build_vignettes = T)

To process the R-code then run:
	
     knitr::knit("main.Rnw")

This results in a file `main.tex` that can then regularly be typeset by XeLaTeX. 

Beware you will probably need to install lots of LaTeX packages and numerous fonts to compile the book.

We have success compiling the `main.tex` document using the MacTeX 2017 distribution of TeX Live and TeXShop, available at: [https://tug.org/mactex/](https://tug.org/mactex/).

To generate the author index, we followed the instructions in the Language Science Press [http://langsci-press.org/public/downloads/LangSci_Guidelines.pdf](style guide):

	sed -i s/.*\\emph.*// main.adx
	makeindex -o main.and main.adx
	
which the `Makefile` then picks up during compilation.
