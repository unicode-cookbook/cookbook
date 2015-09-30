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

# the actual words are in the fifth column of this csv-file ("Value")
# first make draft profile using default settings
write.profile(asjp$Value, file = "sandbox/asjp_draft_profile.csv")

# There is a warning because there are tabs in the input data
# This is an error in the ASJP data, but we leave it in for now
# It has to be changed in the orthography profile though!
# Check the manually changed profile in profiles/asjp_corrected_profile.csv


# after manually correcting the profile we can use it for tokenization
# there are regular expressions in the corrected profile, so "regex = TRUE"
# the code is not very fast, might take about half a minute for all of ASJP
tokens <- tokenize(asjp$Value
					, profile = "profiles/asjp_corrected_profile.csv"
					, regex = TRUE
					)
					
# there are errors in the data. Let's check the errors
tokens$errors

# and look at the characters that are not in the profile
tokens$missing

# look at the errors in this original context
error_lines <- as.numeric(rownames(tokens$errors))
asjp[error_lines,]

# remove errors for now (this has to be done in the original data of course!)
# make "empirical" profile of graphemes, showing all tailored graphemes in ASJP
# there are 793 different tailored graphemes in the data !!!
no_errors <- tokens$strings$tokenized[-error_lines]
tailored <- write.profile(no_errors, sep = " ")
str(tailored)
head(tailored, 20)

# save the profile as a file
write.profile(no_errors, sep = " ", file = "sandbox/asjp_emprical_profile.csv")
