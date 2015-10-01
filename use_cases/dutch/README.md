# Dutch orthograpy

Michael Cysouw

<cysouw@mac.com>

1 October 2015

### Sources

The 10K corpus for Dutch ("nld") was downloaded from <http://corpora2.informatik.uni-leipzig.de/download.html>, as available verbatim in `sources`. From this corpus a cleaned wordlist was created, removing all strange with strange characters, removing all words with multiple capitals in a row, and removing words that start or end with a dash. This process of cleaning uses an orthography profile as well, and it can be inspected by studying at the file `code/correctwordlist.R` and looking at the profiles in the directory `code`.

This wordlist was extended with a selected set of examples of special grapheme-IPA correspondences that were manually collected. These special examples can be found in the file `data/dutch_IPA_profile.tsv` in the column `Examples`.

The result is a wordlist of 27294 (possibly) Dutch words as saved in the file `data/dutch_words.txt`. There are still a few words in the list that are English or German, but basically these are Dutch words.

