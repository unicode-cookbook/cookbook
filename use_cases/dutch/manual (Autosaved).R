

library(qlcTokenize)

# get examples from profile
examples <- read.delim("data/dutch_IPA_profile.tsv", quote = "")$Examples
examples <- unlist(strsplit(as.character(examples), ", "))

# get examples from corpus
nld10K <- read.delim("data/nld10Kwords.txt", header = FALSE, quote = "")
corpus_words <- as.character(nld10K[,2])

# write draft profile
write.profile(corpus_words, file = "sandbox/nld10K_draft_profile.tsv", editing =  TRUE)

# remove all words with obviously non-dutch characters
tokens <- tokenize(corpus_words, profile = "data/nld10K_corrected_profile.tsv", transliterate = "Replacement", sep = "")

# just remove all words that include some strange characters
# and everything that starts or ends with a dash

errors <- as.numeric(rownames(tokens$errors))
corpus_words <- tokens$strings[-errors,]$transliterated



words <- sort(unique(c(examples, corpus_words)))
write(words, file = "sandbox/dutch_words.txt")

words <- scan(file = "data/dutch_words.txt", what = "character")

dutch <- tokenize(words, profile = "data/dutch_IPA_profile.tsv", transliterate = "IPA", file = "tmp", regex = TRUE)
