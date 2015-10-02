#' ---
#' title: "Tokenization of JIPA transcriptions"
#' author: "Michael Cysouw"
#' date: "2 October 2015"
#' ---

library(qlcTokenize)

# adhoc function to compare tokenization with hand-prepared results
compare <- function(jipa) {
	text_in <- paste0("data/", jipa, "_input.txt")
	text_out <- paste0("data/", jipa, "_output.txt")
	
	input <- scan(text_in, what = "character", sep = "\n")
	output <- scan(text_out, what = "character", sep = "\n")
	
	tokenized <- tokenize(input
						, profile = "profiles/validIPA2005_graphemes.tsv"
						, sep = " "
						, sep.replace = "#"
						, file = "tmp"
						, regex = TRUE
						, normalize = "NFD"
						)
	all.equal(output, tokenized$strings$tokenized)

}

# all true!
compare("Brazilian_Portuguese")
compare("Kabiye")
compare("Vietnamese")
compare("Zurich_German")