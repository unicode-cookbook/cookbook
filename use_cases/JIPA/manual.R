#' ---
#' title: "Tokenization of JIPA transcriptions"
#' author: "Michael Cysouw"
#' date: "`r Sys.Date()`"
#' ---

library(qlcTokenize)

#' ### Check automatic tokenization
# check it against hand-made tokenization
# adhoc function to compare tokenization with hand-prepared results

compare <- function(jipa, profile) {
	text_in <- paste0("data/", jipa, "_input.txt")
	text_out <- paste0("data/", jipa, "_output.txt")
	
	input <- scan(text_in, what = "character", sep = "\n")
	output <- scan(text_out, what = "character", sep = "\n")
	
	tokenized <- tokenize(input
						, profile = profile
						, sep = " "
						, sep.replace = "#"
						, regex = TRUE
						, normalize = "NFD"
						)						

	all.equal(output, tokenized$strings$tokenized)

}

# all true as valid IPA!
profile <- "profiles/validIPA2005_graphemes.tsv"
compare("Brazilian_Portuguese", profile)
compare("Kabiye", profile)
compare("Zurich_German", profile)
compare("Vietnamese", profile)

# not all conform to the strict IPA interpretation
profile <- "profiles/strictIPA2005_graphemes.tsv"
compare("Brazilian_Portuguese", profile)
compare("Kabiye", profile)
compare("Zurich_German", profile)
compare("Vietnamese", profile)

#' ### Tailored grapheme clusters
# list all different tailored graphemes with frequencies
# write the profiles with the tailored graphemes to the sandbox
# disaply requires the knitr library
require("knitr")	

tailored <- function(jipa) {
	input <- scan(paste0("data/", jipa, "_input.txt")
				, what = "character"
				, sep = "\n"
				)
	
	tokenized <- tokenize(input
						, profile = "profiles/validIPA2005_graphemes.tsv"
						, sep = " "
						, sep.replace = ""
						, regex = TRUE
						, normalize = "NFD"
						)

	profile <- write.profile(tokenized$strings$tokenized
				, sep = " "
				, file.out = paste0("sandbox/", jipa, "_profile.tsv")
				)
				
		
	invisible(knitr::kable(profile))
}

# write all to sandbox
tailored("Brazilian_Portuguese")
tailored("Kabiye")
tailored("Zurich_German")
# only show Vietnamese here in a nice format
(tailored("Vietnamese"))
