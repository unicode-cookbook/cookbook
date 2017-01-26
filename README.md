# Unicode Cookbook for Linguists

Steven Moran <bambooforest@gmail.com> & Michael Cysouw <cysouw@mac.com>

The book is typeset with XeLaTeX, but there is knitr-based R-code included. This has to be first processed to return latex code, which can then be typeset.

The knitr setup is included in the file `unicode.Rnw`. To process this file, the following R-packages need to be installed:

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

Note, you may need to install various LaTeX packages, fonts, or other dependencies to compile this book.
