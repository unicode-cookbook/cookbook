# ASJP use-case

###Michael Cysouw
<cysouw@mac.com>
30 September 2015

The ASJP-data are available online at http://asjp.clld.org (Wichmann, Brown & Holman, 2014). The original downloaded data is available verbatim in "/sources/".

The downloaded data comes in separate files, so I combined everything into one large csv file by using:
  $$$ awk 'FNR>1' sources/*.csv > data/ASJ
and then manually added a new header line. When you have csvkit installed, it can be done cleaner by:
  $$$ csvstack sources/*.csv > data/ASJP.csv

###References

Wichmann, Søren & Brown, Cecil H. & Holman, Eric W. 2014. The The ASJP Database Database. Leipzig: Max Planck Institute for Evolutionary Anthropology. (Available online at http://asjp.clld.org, Accessed on 2015-08-31.)

