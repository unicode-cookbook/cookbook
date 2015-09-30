#' ---
#' title: "Analysis of ASJP data"
#' author: "Michael Cysouw"
#' date: "30 September 2015"
#' ---

# install library from github
# only necessary once
# install.packages("devtools")
# devtools::install_github("cysouw/qlcTokenize")
library(qlcTokenize)

# read ASJP data
# this is pretty large, so it might take a bit
asjp <- read.csv("data/ASJP.csv")

# first make draft profile using default settings
write.profile(asjp$Value, file = "sandbox/asjp_draft_profile.csv")

# There is a warning because there are tabs in the input data
# This is an error in the ASJP data, but we leave it in for now
# It has to be changed in the orthography profile though!
# Check the manually changed profile in profiles/asjp_corrected_profile.csv


# correct this manually in the file profile and do tokenization
# the code is not very fast, might take about half a minute for all of ASJP
system.time(
	tokens <- tokenize(asjp$Value
						, profile = "profiles/asjp_corrected_profile.csv"
						, regex = T
						, file.out = "sandbox/")
	)

# check errors
tokens$errors
err_lines <- as.numeric(rownames(tokens$errors))
asjp[err_lines,]
no_errors <- tokens$strings$tokenized[-err_lines]

# make "empirical" profile of graphemes
write.profile(no_errors, sep = " ", file = "asjp_emprical_profile.csv")
