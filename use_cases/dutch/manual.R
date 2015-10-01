#' ---
#' title: "IPA-transliteration of dutch words"
#' author: "Michael Cysouw"
#' date: "1 October 2015"
#' ---

library(qlcTokenize)
# read the wordlist with dutch words
words <- scan(file = "data/2_dutch_words.txt", what = "character")

# use the hand-made orthography profile in `data/dutch_IPA_profile.tsv`
dutch <- tokenize(words
				, profile = "data/1_dutch_IPA_profile.tsv"
				, transliterate = "IPA"
				, file = "sandbox/3_dutch"
				, regex = TRUE
				, sep = ""
				)

# there are only a errors coming from the tokenization
dutch$errors

# the IPA transliterations seems to be fine
# there are some errors, but only a few
# let's just check a random selection 
# (note that this selection will change every time this code is executed)
selection <- sample(1:nrow(dutch$strings), 50)
dutch$strings[selection, c("originals", "transliterated")]