# Unicode Cookbook for Linguists

Steven Moran <bambooforest@gmail.com> & Michael Cysouw <cysouw@mac.com>


## About the cookbook

The cookbook is available in its current form in this directory as `unicode-cookbook.pdf`.

The text is meant as a practical guide for linguists, and programmers, who work with data in multilingual computational environments. We introduce the basic concepts needed to understand how writing systems and character encodings function, and how they work together.

The intersection of the Unicode Standard and the International Phonetic Alphabet is often not met without frustration by users. Nevertheless, the two standards have provided language researchers with a consistent computational architecture needed to process, publish and analyze data from many different languages. We bring to light common, but not always transparent, pitfalls that researchers face when working with Unicode and IPA. 

Our research uses quantitative methods to compare languages and uncover and clarify their phylogenetic relations. However, the majority of lexical data available from the world's languages is in author- or document-specific orthographies. Having identified and overcome the pitfalls involved in making writing systems and character encodings syntactically and semantically interoperable (to the extent that they can be), we created a suite of open-source Python and R tools to work with languages using profiles that adequately describe their orthographic conventions. Using orthography profiles and these tools allows users to segment text, analyze it, identify errors, and to transform it into different written forms.

We welcome comments and corrections of this text or the code in the case studies. Please use the issue tracker in this book's repository or email us directly.


## How to compile the book

For those interested, the book is typeset with XeLaTeX, but there is knitr-based R-code included. This has to be first processed to return latex code, which can then be typeset.

The knitr setup is included in the file `unicode.Rnw`. To process this file, the following R-packages need to be installed (`packages.install('knitr')`):

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

Note, you will probably need to install lots of LaTeX packages and fonts to compile.
