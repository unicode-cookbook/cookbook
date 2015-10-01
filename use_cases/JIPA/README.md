# JIPA use-case

### Steven Moran

<steven.moran@uzh.ch>

30 September 2015

### Overview

The Journal of the International Phonetic Alphabet (JIPA)[1] publishes short articles called Illustrations of the IPA, each of which describes the consonants, vowels and prosodic features of a particular language variety. These illustrations also contain a short text, in narrow or broad transcription (or both), and sometimes an orthographic version. The text is typically The North Wind and the Sun passage.[2] A non-exhaustive list of languages for which an Illustration of the IPA exists can be found here.[3] 

The data used in this case study come from four illustrations featuring these language varieties: Brazilian Portuguese (ISO 639-3: por)[4], Kabiye (kbp)[5], 
Vietnamese (vie)[6] and Zurich German (gsw)[7]. The data are available in PDF in the `sources` directory and the text passages have been extracted into *UTF-8 NFC LF no BOM* text in the `data` directory.

### Installation

#### For users

To install the Python implementation of the orthography profiles tokenizer, you must have the Python programming language installed on your computer and the Python Package Index (pip).

https://www.python.org/downloads/

Install the tokenizer:

`pip install tokenzier`

Alternatively, you can then download the tokenizer package from:

<URL>

and run `python setup.py install` to install the tokenizer.

#### For developers

The source code is available on Github:

https://github.com/bambooforest/orthotokenizer

and is written in Python. The code can be cloned


### Tokenization

The `tokenizer` has a built-in function to tokenize graphemes into IPA. The method is called `tokenize_ipa` in the source code and is called from the command line as:

`tokenize <input file>`


### References

[1] https://www.internationalphoneticassociation.org/

[2] https://en.wikipedia.org/wiki/The_North_Wind_and_the_Sun

[3] http://www-01.sil.org/~olsonk/ipa.html

[4] Barbosa, Plínio A. & Eleonora C. Albano. 2004. Brazilian Portuguese. JIPA 34(2). 227–232.

[5] Padayodi, Cécile M. 2008. Kabiye. JIPA 38(2). 215–221.

[6] Kirby, James. 2011. Vietnamese (Hanoi Vietnamese). JIPA 41(3). 381-392.

[7] Fleischer, Jürg & Stephan Schmid. 2006. Zurich German. JIPA 36(2). 243–253.