#' ---
#' title: "IPA-transliteration of dutch words"
#' author: "Michael Cysouw"
#' date: "1 October 2015"
#' ---

library(qlcTokenize)


# read the wordlist with dutch words
words <- scan(file = "data/dutch_words.txt", what = "character")

dutch <- tokenize(words
				, profile = "data/dutch_IPA_profile.tsv"
				, transliterate = "IPA"
				, file = "sandbox/dutch"
				, regex = TRUE
				)
