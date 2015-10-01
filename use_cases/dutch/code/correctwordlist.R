#' ---
#' title: "Preparation of dutch wordlist"
#' author: "Michael Cysouw"
#' date: "1 October 2015"
#' ---

library(qlcTokenize)

# get examples from handmade profile
examples <- read.delim("../data/1_dutch_IPA_profile.tsv", quote = "")$Examples
examples <- unlist(strsplit(as.character(examples), ", "))

# get examples from corpus
nld10K <- read.delim("../sources/nld_mixed_2012_10K-words.txt", header = FALSE, quote = "")
corpus_words <- as.character(nld10K[,2])

# write draft profile of corpus
write.profile(corpus_words
			, file = "../sandbox/nld10K_draft_profile.tsv"
			, editing =  TRUE
			)

# edit the profile by hand, removing strange characters
# and adding some conditional constraints of character occurrence
# this leads to the profile in "data/nld10K_corrected_profile.tsv"

# remove all words with obviously non-dutch characters
# just remove all words that include some strange characters
tokens <- tokenize(corpus_words
					, profile = "nld10K_corrected_profile.tsv"
					, transliterate = "Replacement"
					, sep = ""
					, regex = TRUE
					)
errors <- as.numeric(rownames(tokens$errors))
corpus_words <- tokens$strings[-errors,]$transliterated

# combine the corpus with the hand-selected examples
# write these to a file
words <- sort(unique(c(examples, corpus_words)))
write(words, file = "../sandbox/2_dutch_words.txt")
