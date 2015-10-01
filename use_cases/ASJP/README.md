# ASJP use-case

###Michael Cysouw
<cysouw@mac.com>

30 September 2015

###Data preparation

The ASJP-data are available online at <http://asjp.clld.org/static/download/asjp-dataset.cldf.zip> (Wichmann, Brown & Holman, 2014). The original downloaded data is available verbatim in the directory `sources`.

The downloaded data comes in separate files, so I combined everything into one large csv file by using the following bash command. I then manually added a new header line.

`$$$ awk 'FNR>1' sources/*.csv > data/ASJ`

When you have csvkit installed, it can be done cleaner by:

`$$$ csvstack sources/*.csv > data/ASJP.csv`

###Orthographic processing

The steps to process the orthography of the ASJP words using R is found in `manual.R`. The file `manual.html` shows what happens when you run all these commands (produced by `rmarkdown::render`). Any files written by these commands are by default saved into the directory `sandbox`. The intended results can also be found in the directory `data`.

###References

Wichmann, Søren & Brown, Cecil H. & Holman, Eric W. 2014. The The ASJP Database Database. Leipzig: Max Planck Institute for Evolutionary Anthropology. (Available online at <http://asjp.clld.org>, Accessed on 2015-08-31.)

