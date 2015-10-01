#' ---
#' title: "Analysis of ASJP data"
#' author: "Michael Cysouw"
#' date: "30 September 2015"
#' ---

#' === STEP 0: Preparation ===
# install library from github
# install.packages("devtools")
# devtools::install_github("cysouw/qlcTokenize")
library(qlcTokenize)

# read ASJP data
# this is pretty large, so it might take a bit
asjp <- read.csv("data/ASJP.csv")

#' === STEP 1: making a draft profile ===
# the actual words are in the fifth column of this csv-file ("Value")
# first make draft profile using default settings
write.profile(asjp$Value, file = "sandbox/1_asjp_draft_profile.tsv")

#' === STEP 2: correcting the draft profile ===
# There is a warning because there are tabs in the input data
# This is an error in the ASJP data, but we leave it in for now
# It has to be changed in the orthography profile though!
# Check the manually changed profile in data/2_asjp_corrected_profile.tsv
# This profile should be capturing the ASJP orthography

#' === STEP 3: tokenize the data and inspect errors ===
# after manually correcting the profile we can use it for tokenization
# there are regular expressions in the corrected profile, so "regex = TRUE"
# save all the information from the tokenization in the sandbox
# the code is not very fast, might take about half a minute for all of ASJP
tokens <- tokenize(asjp$Value
					, profile = "data/2_asjp_corrected_profile.tsv"
					, regex = TRUE
					, file.out = "sandbox/3_asjp_result"
					)
# there are errors in the data. Let's check the errors
tokens$errors
# and look at the characters that are not in the profile
tokens$missing

# look at the errors in their original context
error_lines <- rownames(tokens$errors)
asjp[error_lines,]

#' === STEP 4: error correction and investigate tailored graphemes ===
# remove errors for now (this has to be done in the original data of course!)
no_errors <- tokens$strings[-as.numeric(error_lines),]
# make "empirical" profile of tokenized data, showing all tailored graphemes in ASJP
tailored <- write.profile(no_errors$tokenized
						, sep = " "
						, file.out = "sandbox/4_asjp_tailored_profile.tsv"
						)

# there are 793 different tailored graphemes in the data !!!
str(tailored)
# just show the first 20 tailored graphemes as an example
head(tailored, 20)