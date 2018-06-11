biblatex-sp-unified
===================

An opinionated BibLaTeX implementation of the Unified Stylesheet for Linguistics Journals

# Warning #

This distribution is at best in the alpha stage. Use at your own risk and please file a github "issue" to let me know of any problems you encounter and any recommendations for improvement.

# Introduction #

`biblatex-sp-unified` is an opinionated implementation in BibLaTeX of the [Unified Stylesheet for Linguistics Journal](http://celxj.org/downloads/UnifiedStyleSheet.pdf). The stylesheet was developed by [CELxJ, the Committee of Editors of Linguistics Journals](http://celxj.org/). There is a standard BibTeX implementation, called [`unified.bst`](http://celxj.org/downloads/unified.bst), which was developed by Bridget Samuels, based on work done for the house-style of the journal [*Semantics and Pragmatics (S&P)*](http://semprag.org).

The current project is a ground-up re-implementation in modern BibLaTeX. It is now being used by *S&P* for its articles.

# Installation and use

The `biblatex-sp-unified` style consists of two files: `biblatex-sp-unified.bbx` (which contains the bibliography formatting code) and `sp-authoryear-comp.cbx` (which contains the code for formatting in-text citations in the style of *S&P*; since the Unified Stylesheet does not give any guidelines of in-text citations, this file is optional and users can choose other citation styles). These should be put somewhere where your TeX system can find them (perhaps, `~/Library/texmf/tex/latex/biblatex/{bbx,cbx}/`.

The style depends on a modern TeX installation that includes biblatex 2.0+. It is tested only with the biber backend.

To use the style in conjunction with sp.cls, you have to do two things:

1. include the class option 'biblatex' when calling sp.cls:

    `\documentclass[biblatex]{sp.cls}`

2. include a line in your preamble that loads your bib-file:

    `\addbibresource{your-bib-database.bib}`

   NB: the suffix `.bib` needs to be included (this is different from bibtex)

3. Finally, replace the `\bibliography` line in the backmatter with the following:

    `\printbibliography`

You can use the style with other document classes as well. In that case, replace step 1 above with the following lines in your preamble:

    \usepackage[backend=biber,
            bibstyle=biblatex-sp-unified,
            citestyle=sp-authoryear-comp,
            maxcitenames=3,
            maxbibnames=99]{biblatex}

# Implementing the Unified Style Sheet for Linguistics Journals

`biblatex-sp-unified` is meant to implement as fully as possible the [Unified Style Sheet for Linguistics Journals](http://celxj.org/downloads/UnifiedStyleSheet.pdf). It consists of a number of guidelines and thoughts on the formatting of bibliographies, a sample bibliography and some comments on that sample.

The `biblatex-sp-unified` distribution includes a copy of the Unified Style Sheet and a bib-file that corresponds to the references typeset in the Style Sheet specifications. So, this bib-file can be used to test the implementation of the Style Sheet. We include the source code of the test LaTeX file and the resulting pdf to demonstrate that we have faithfully implemented the Style Sheet, with some minor differences.

When it comes to implementing the guidelines in a LaTeX typesetting environment, most of the guidelines can be implemented in the bibliography style (a bst file for BibTex or a bbx file for BibLaTeX), but there are some points that need to be taken into account earlier in the preparation of the bib file containing the bibliographic details for the references to be listed.

Here is a point by point copy of the Unified Style Sheet guidelines, followed by commentary on our implementation.

>1\. **Superfluous font-styles should be omitted.** Do not use small caps for author/editor names, since they do not help to distinguish these from any other bits of information in the citation. In contrast, italics are worthwhile for distinguishing volume (book, journal, dissertation) titles [+ital] from article and chapter titles [-ital].

>2\. **Superfluous punctuation should be left out.** Once italic is adopted to distinguish volumes from articles/chapters (as above), then single or double quotations around article titles are superfluous and only add visual clutter.

`biblatex-sp-unified`: Article and chapter titles are set in roman font, while titles of books, dissertations, and journals are set in italics. There are no quotation marks around titles.

>3\. **Differing capitalization styles should be used to make category distinctions.** Use capitalization of all lexical words for journal titles and capitalize only the first word (plus proper names and the first word after a colon) for book/dissertation titles and article/chapter titles. This is a useful diagnostic for discriminating between titles that are recurring and those that are not. The journal style for capitalization should also be applied to the title of book series. Thus, the citation of a SNLLT volume would be punctuated: *Objects and other subjects: Grammatical functions, functional categories, and configurationality* (Studies in Natural Language and Linguistic Theory 52).

`biblatex-sp-unified`: Recurring titles (i.e. titles of journals and book series) are set in title case (capitalization of all lexical words), while non-recurring titles (articles, chapters, books, dissertations) are set in sentence case (capitalize only the first word, plus proper names and the first word after a colon).

NB: It is fairly easy to convert a title given in title case into sentence case. But the other way round is quite difficult. `biblatex-sp-unified.bbx` depends on the bib file containing title case for those elements that should be set in title case. For those elements that will be set in sentence case, the bbx file will do the conversion to sentence case. Proper names (and the first word after a colon) need to be protected against that lower casing, so the bib-file should have `{...}` braces around those words. Please note that just putting `{}` around the first letter in words that should be capitalized is bad practice since it prevents proper kerning of the space between the first and second letter. Even worse practice is to "double wrap" a whole title in braces, which prevents any style file from setting the title in the style specified by its formatting philosophy.

NB: It is to be encouraged that titles and subtitles be entered into separate fields in the bib entry. In that case, the bbx file will properly capitalize the first letter of the subtitle. So, the first of the following formats is preferred for use with the unified bbx style (but it has the disadvantage of not necessarily being compatible with other bibliography styles):

Option 1

    title = {Government and Binding Theory and the Minimalist Program},
    subtitle = {Principles and Parameters in Syntactic Theory},

Option 2

    title = {Government and Binding Theory and the Minimalist Program: {Principles} and Parameters in Syntactic Theory},

>4\. **All author/editor first names should be spelled out.** Not doing so only serves to make the citation less informative. Without full first names, the 20th century index for Language alone would conflate five different people as ‘J. Smith’, four as ‘J. Harris’, three each under ‘A. Cohen’ and ‘P. Lee’, two each under ‘R. Kent’, ‘J. Anderson’, ‘H. Klein’ and ‘J. Klein’.

`biblatex-sp-unified`: The style does not abbreviate first names. Compliance with the Unified Style depends on the bib-file containing full names for everyone.

>5\. **The ampersand is useful.** Use ampersand to distinguish higher and lower order conjuncts, i.e. [W & X] and [Y & Z], as in Culicover & Wilkins and Koster & May. It is relatively easy to see that reference is made here to two pairs of authors here (cf. Culicover and Wilkins and Koster and May).

`biblatex-sp-unified`: The style uses the ampersand rather than a final "and" in author and editor lists. This is taken care of by `biblatex-sp-unified`.

>6\. **Name repetitions are good.** While using a line ____ may save a little space, or a few characters, it also makes each such citation referentially dependent on an antecedent, and the effort of calculating such antecedents is more than what it saved typographically. Each citation should be internally complete.

`biblatex-sp-unified`: The style does not use a dashed line for repeated authors in the reference list.

>7\. **Four digit year plus period only.** Extra parentheses are visual clutter and superfluous.

`biblatex-sp-unified`: The style complies with the Unified Style Sheet.

>8\. **Commas and periods and other punctuation.** Separate citation components with periods (e.g., Author. Year. Title.) and subcomponents with commas (e.g., Author1, Author2 & Author3). Please note the ampersand (&), rather than the word “and” before the name of the last author, and no comma before the “&”. The use of the colon between title and subtitle and between place and publisher is traditional, but we do not use it between journal volumenumber and pagenumbers.

`biblatex-sp-unified`: The style complies with the Unified Style Sheet.

>9\. **Parentheses around ed. makes sense.** Commas and periods should be used exclusively to separate citation components (e.g., "Author. Year."), or subcomponents (e.g. "author1, author2 & author3). Since "ed." is neither a component nor a subcomponent, but a modifier of a component, it should not be separated from the name by a comma:

>    surname, firstname = author
     surname, firstname (ed.). = editor (NOT surname, firstname, ed.)
     surname, firstname & firstname surname (eds.) = editors

`biblatex-sp-unified`: The style complies with the Unified Style Sheet.

>10\. **For conference proceedings, working papers, etc.** For conference proceedings published with an ISSN, treat the proceedings as a journal: Include both the full conference name and any commonly used acronym for the conference (BLS, WCCFL, etc.) in the journal title position. For proceedings not published with an ISSN, treat the proceedings as any other book, using the full title as listed on the front cover or title page. If the title (and subtitle if there is one) only includes an acronym for the conference name, expand the acronym in square brackets or parentheses following the acronym. If the title does not include an acronym which is commonly used for the conference name, include the acronym in square brackets or parentheses following the conference name. The advantage of including the acronym after the society title is that it makes the entry much more identifiable in a list of references.

[From the comments by Joseph Salmons:]

>Do not include “proceedings of the” or “papers from the”.

NB: The examples included with the Unified Style Sheet do not include the editors of the CLS proceedings volume. We agree with this practice, since the names of editors of such proceedings are often hard to get hold of.

`biblatex-sp-unified`: These guidelines need to be satisfied in the construction of the bib-file. There are two approaches, one more of a hack than the other:

*Option 1*: Use the `@inproceedings` entry type and include the ISSN of the proceedings when available. Example:

    @inproceedings{casali:1998a,
        Author = {Casali, Roderic F.},
        Booktitle = {Chicago Linguistic Society (CLS)},
        ISSN = {0577-7240},
        Number = {1},
        Pages = {55-68},
        Title = {Predicting {ATR} Activity},
        Volume = {34},
        Year = {1998}}

Comment: Following the Unified Style Sheet, we can let the presence of an ISSN control whether an article in conference proceedings is set like a journal article or like a book chapter. To do this, the bib-file needs to contain the ISSN of proceedings where possible. When the ISSN is in the bib-file, `biblatex-sp-unified` will not print it with the entry but it will trigger setting as an article. If there's no ISSN in the entry, `biblatex-sp-unified` will set it as a book chapter. The ISSN can be found through [WorldCat](http://www.worldcat.org) fairly easily. Here's a list of common conference proceedings with their ISSN:

* BLS: 0363-2946
* CLS: 0577-7240
* NELS: 0883-5500
* SALT: 2163-5951
* WCCFL: 1042-1068

*Option 2*: Another option, less portable and definitely a hack, is to use the `@article` entry type, putting the conference name (and the acronym in parentheses; no need to case protect the acronym, since journal titles are set as is) in the `journal` field, and do not list the editors. Example:

    @article{casali:1998b,
        Author = {Casali, Roderic F.},
        Journal = {Chicago Linguistic Society (CLS)},
        Number = {1},
        Pages = {55-68},
        Title = {Predicting {ATR} Activity},
        Volume = {34},
        Year = {1998}}

>11\. **Use “edn.” as an abbreviation for “edition”, thus “2nd edn.”.** This avoids ambiguity and confusion with “ed.” (editor).

`biblatex-sp-unified`: The style complies with the Unified Style Sheet.

>12\. **Names with “von”, “van”, “de”, etc.** If the "van" (or the "de" or other patronymic) is lower case and separated from the rest by a space (e.g. Elly van Gelderen), then alphabetize by the first upper-case element:

>    `Gelderen, Elly van`

>The addition of "see ..." in comprehensive indices and lists might be helpful for clarification:

>    `van Gelderen, Elly (see Gelderen)`

`biblatex-sp-unified`: This is a point where we depart from the Unified Style Sheet. If the "van" (or the "de" or other patronymic) is lower case and separated from the rest by a space (e.g. Elly van Gelderen), then alphabetize by the first upper-case element **but display the particle as part of the last name in its usual position**:

    `van Gelderen, Elly [alphabetized under "G"]`

NB: biblatex-sp-unified is the only BibLaTeX style that we know of that implements this practice (it took some hacking to make this possible). There is no need to do anything in the bib-file to ensure proper treatment of "von" etc.

>13\. **Names with “Jr.”, “IV.”, etc.** Following library practice, list elements such as “Jr.” as a subelement after names, separated by a comma.

`biblatex-sp-unified`: The style complies with the Unified Style Sheet.

>14\. **Use “In” to designate chapters in collections.** This makes the book's format maximally similar to the standard citation format. This, in turn, would be time-saving when the author or the editor notice that more than one article is cited from a given collection and hence that that book’s details should be set out as a separate entry in the references (and the full details deleted from the articles’ entries).
    author. year. chaptertitle. In editorname (ed.), collectiontitle, pagenumbers. publisher.

`biblatex-sp-unified`: The style complies with the Unified Style Sheet.

>15\. **Journal volume numbers.** We favor: volumenumber(volumeissue). startingpage--endingpage. Thus: 22(1). 135-169. Note the space between volume number/issue and page numbers. Special formatting (e.g., bold for volume number) is superfluous. Issue numbers are a parenthetical modifier (cf. "ed." above) of the volume number. While it is not NECESSARY information for identifying the article, it is extremely USEFUL information.

`biblatex-sp-unified`: The style complies with the Unified Style Sheet. Providing issue numbers is a guideline for the preparation of the bib-file.

>16\. **Dissertations/theses.** These conform to the already-widespread Place: Publisher format and fit readily into the rest of the standard: Cambridge, MA: MIT dissertation. Instead of archaic state abbreviations, use the official two-letter postal abbreviations. Note that national and other traditions vary in exactly what is labeled ‘thesis’ versus ‘dissertation’ and in distinguishing ‘PhD’ from ‘doctoral’ dissertations.
    Cambridge, MA: MIT dissertation.
    Chapel Hill: UNC MA thesis.

`biblatex-sp-unified`: The style complies with the Unified Style Sheet. Using the two-letter postal abbreviations is something that needs to be taken care of during the preparation of the bib-file.

>17\. **On-line materials.** The basic information here -- author, date, title -- remains the same, and the URL where the resource was found takes the place of publisher or journal. We urge authors to include the date the material was accessed, in parentheses after the URL, since new versions often replace old ones. For a .pdf file, this would be the date of downloading, but for a resource like an on-line dictionary consulted repeatedly, a range of dates may be needed. For additional discussion of handling online citations, authors may want to consult this guide:

>    Walker, Janice R. & Todd Taylor. 1998. The Columbia Guide to Online Style. New York: Columbia University Press.

`biblatex-sp-unified`: We take it that this does not refer to material that has officially been published online, in which case permanent document identifiers such as DOIs and the like will take care of the linking requirements. Rather, we are assuming this refers to "unpublished" material available online (on author's homepages or repositories such as the Semantics Archive or LingBuzz). In this case, just use the `@unpublished` entry-type, give the URL in the `url = {}` field, and if deemed necessary include the date the material was accessed by adding an `urldate = {}` field. The date should be given in YYYY-MM-DD format, e.g. `urldate = {2013-08-11}`. The style will then add the date in parentheses, formatted to the style sheet's rather odd format.

# Departures from the Unified Style Sheet #

We already mentioned our one major disagreement with the Unified Style Sheet: the incorrect treatment of the "von" part of names.

We depart from the style sheet only in a few other places. These are actually only departures from the example formatting given and do not pertain to any explicit guidelines.

1. The acronym "CLS" given in parentheses after "Chicago Linguistic Society" in the Casali 1986 entry is not given in italics in the example. Since it is part of the "journal title" field, `biblatex-sp-unified` will typeset it in italics.
2. The example URLs have a period inside the parentheses around the URL access date. We have relocated this period to outside the parentheses.
3. In the one case of an online journal article, the Pedersen 2005 entry, the example has a comma between the journal + volume and the URL. We think that this is analogous to the break between journal + volume(issue) and page numbers, and so it should be a period instead of a comma. That is what `biblatex-sp-unified` does.
4. There is a period between the URL and the URL access date (which is in parentheses). We do not think that this period should be there. `biblatex-sp-unified` has a space.

# Guidelines for the preparation of bib files

For convenience, we repeat the best practices for preparing your bib file for use with `biblatex-sp-unified`.

1. Any words in the titles of articles, books, dissertations that should not be lowercased (other than the first word) have to be protected by {} brackets around that word (not just around the first letter of the word and never double wrap the entire title!). This includes the first word after a subtitle colon (unless the subtitle field is used instead).
2. Give full first names for all authors and editors (all persons listed in the bib file).
3. For conference proceedings, working papers, etc. For conference proceedings published with an ISSN, treat the proceedings as a journal: Include both the full conference name and any commonly used acronym for the conference (BLS, WCCFL, etc.) in the journal title position. Do not include the editors in the bib-file. For proceedings not published with an ISSN, treat the proceedings as any other book, using the full title as listed on the front cover or title page. If the title (and subtitle if there is one) only includes an acronym for the conference name, expand the acronym in square brackets or parentheses following the acronym. If the title does not include an acronym which is commonly used for the conference name, include the acronym in square brackets or parentheses following the conference name. The advantage of including the acronym after the society title is that it makes the entry much more identifiable in a list of references. Do not include “proceedings of the” or “papers from the”.
4. For on-line materials, you can give the date the resource was accessed. Use the `urldate` field for this purpose and give the date in the YYYY-MM-DD format, e.g. `2013-08-11`.
5. Use two-letter postal abbreviations for all US cities.
