# Unicode Cookbook for Linguists

Steven Moran \<bambooforest@gmail.com> & Michael Cysouw <cysouw@mac.com>


## How to compile the book

For those interested, the book is typeset with XeLaTeX, but there is knitr-based R-code included. This has to be first processed to return latex code, which can then be typeset.

The knitr setup is included in the file `unicode.Rnw`. To process this file, the following R-packages need to be installed (`install.packages.("knitr")`):

- knitr
- highlight
- qlcData
- xtable

Note that the package `qlcData` will probably need the newest version from Github, to be installed within R using:

     install.packages("devtools")
     devtools::install_github("cysouw/qlcData", build_vignettes = T)

To process the R-code then use:
	
     knitr::knit("unicode.Rnw")

This results in a file `unicode.tex` that can then regularly be typeset by XeLaTeX. 

Note, you will probably need to install lots of LaTeX packages and numerous fonts to compile the book.

We have success compiling the `unicode.tex` document using the MacTeX 2016 distribution of TeX Live and TeXShop, available at: [https://tug.org/mactex/](https://tug.org/mactex/).
