\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LSP/langsci}[2014/11/27 Language Science Press]

% Default values:
\usepackage{xspace}
\newcommand{\lsp}{Language Science Press\xspace}
\newcommand{\lsSeriesNumber}{??}
\newcommand{\lsISSN}{??}
\newcommand{\lsISBN}{000-0-000000-00-0}
\newcommand{\lsURL}{http://langsci-press.org/catalog}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsSpineBreadth}{20mm}
\newcommand{\lsOutput}{long}
\newcommand{\lsFontsize}{11pt}
\newcommand{\lsCopyright}{CC-BY}
\newcommand{\lsBiblatexBackend}{bibtex}
\newif\iflsDraft \lsDraftfalse
\newif\iflsIndex \lsIndextrue
\newif\iflsBiblatex \lsBiblatexfalse
\newif\iflsCollection \lsCollectionfalse
\newif\iflsCollectionChapter \lsCollectionChapterfalse
\newif\iflsCollectionTOCLong \lsCollectionTOCLongfalse
\newif\iflsNewtxmath \lsNewtxmathfalse


% Option handling:
\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langsci,
	prefix=langsci@ }
\DeclareStringOption{number}[??]
	\define@key{langsci}{number}{%
		\renewcommand{\lsSeriesNumber}{#1}}
\DeclareStringOption{issn}[??]
	\define@key{langsci}{issn}{%
		\renewcommand{\lsISSN}{#1}}
\DeclareStringOption{isbn}[000-0-000000-00-0]
	\define@key{langsci}{isbn}{%
		\renewcommand{\lsISBN}{#1}}
\DeclareStringOption{url}[http://langsci-press.org/catalog]
	\define@key{langsci}{url}{%
		\renewcommand{\lsURL}{#1}}
\DeclareStringOption{series}[eotms]
	\define@key{langsci}{series}{%
		\renewcommand{\lsSeries}{#1}}
\DeclareStringOption{output}[long]
	\define@key{langsci}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareStringOption{copyright}[CC-BY]
	\define@key{langsci}{copyright}{%
		\renewcommand{\lsCopyright}{#1}}
\DeclareStringOption{biblatexbackend}[bibtex]
	\define@key{langsci}{biblatexbackend}{%
		\renewcommand{\lsBiblatexBackend}{#1}}
\DeclareVoidOption{blackandwhite}{
	\newcommand{\blackandwhite}{}}
\DeclareVoidOption{long}{
	\renewcommand{\lsOutput}{long}}
\DeclareVoidOption{smallfont}{  			
	\renewcommand{\lsFontsize}{10pt}}
\DeclareVoidOption{draftmode}{	% 'draftmode' instead of 'draft' due to undesirable side efects	
	 \lsDrafttrue
	 \overfullrule=5pt	}	% to indicate overfull hboxes
\DeclareVoidOption{noindex}{  			
	\lsIndexfalse }
\DeclareVoidOption{biblatex}{  			
	\lsBiblatextrue}
\DeclareVoidOption{newtxmath}{  			
	\lsNewtxmathtrue}
\DeclareVoidOption{collection}{  			
	\lsCollectiontrue}
\DeclareVoidOption{collectionchapter}{  			
	\lsCollectiontrue
	\lsCollectionChaptertrue}
\DeclareVoidOption{collectiontoclong}{  			
	\lsCollectiontrue
	\lsCollectionTOCLongtrue}
\ProcessKeyvalOptions{langsci}

\LoadClass[
	fontsize=\lsFontsize, % default is 11pt
	footnotes=multiple,
	numbers=noenddot,		% no point after last number of chapters/sections
	toc=bibliographynumbered,
	index=totoc,
	%chapterprefix=true,
	%draft=yes,
	]{scrbook}


\usepackage{etex}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Page size and text area:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
\usepackage[ 
	papersize={170mm,240mm}
	,top=27.4mm % TODO nachgemessen, nach Vermassung eigentlich 30mm-16pt = 25.8mm
	,inner=20.5mm, 
	,outer=24.5mm
	%,showframe,pass
	,marginparwidth=50pt
	]{geometry}
			

\usepackage[
	absolute 		% for absolute positioning in titlepage
	%,showboxes
	]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}

\usepackage{pbox}   % boxes with maximum width
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Fonts, language and graphics:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xstring} 	% for manipulating strings
\usepackage{ifxetex}
\ifxetex\else\ClassError{LSP/langsci}{Please use XeLaTeX!}{}\fi
	
\usepackage{amssymb} % has to be loaded before other stuff
\usepackage{dtklogos}\newcommand{\xelatex}{\XeLaTeX\xspace}	% the XeLaTeX symbol			
\usepackage{fontspec}
\newcommand{\fontpath}{./LSP/lsp-fonts/}

\setsansfont[
	%Ligatures={TeX,Common},		% not supported by ttf
	Scale=MatchLowercase,
	Path=\fontpath,
	BoldFont = Arimo-Bold_B.ttf ,
	ItalicFont = Arimo-Italic_B.ttf ,				
	BoldItalicFont = Arimo-BoldItalic_B.ttf 		
	]{Arimo_B.ttf}
		
\setmonofont[
	Ligatures={TeX},Scale=MatchLowercase,Path=\fontpath,
	BoldFont = FreeMonoBold_B.otf ,
	SlantedFont = FreeMonoOblique_B.otf ,				
	BoldSlantedFont = FreeMonoBoldOblique_B.otf 		
	]{FreeMono_B.otf}


\setmainfont[
	Ligatures={TeX,Common},
	Path=\fontpath,
	PunctuationSpace=0,							
	%Numbers={OldStyle,Proportional},				% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
	Numbers={Proportional},	% normal numbers			% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
	BoldFont = LinLibertine_RZ_B.otf ,				% semi-bold
	ItalicFont = LinLibertine_RI_B.otf ,			
	BoldItalicFont = LinLibertine_RZI_B.otf 		% semi-bold
	]{LinLibertine_R_B.otf}			

\iflsNewtxmath							% some users have problems when installing newtxmath
	\usepackage[libertine]{newtxmath}
\fi 	

\let\oldtabular\tabular	% number in tabulars
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\normalfont\addfontfeatures{Numbers=Lining}\selectfont\oldtabular}{\endoldtabular}
 
  %\usepackage{polyglossia}		% TODO remove this?
  %\setdefaultlanguage{british}

%\frenchspacing			
\usepackage[final]{microtype}
\usepackage{graphicx}

  \newcommand{\lsCoverTitleFont}[1]{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverSubTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsCoverAuthorFont}{\fontsize{25pt}{12.5mm}\selectfont}
  \newcommand{\lsCoverSeriesFont}{\sffamily\fontsize{17pt}{7.5mm}\selectfont}			% fontsize?
  \newcommand{\lsCoverSeriesHistoryFont}{\sffamily\fontsize{10pt}{5mm}\selectfont}
  \newcommand{\lsInsideFont}{}	% obsolete, see \setmainfont
  \newcommand{\lsDedicationFont}{\fontsize{15pt}{10mm}\selectfont}
  \newcommand{\lsBackTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsBackBodyFont}{\lsInsideFont}
  \newcommand{\lsSpineAuthorFont}{\fontsize{16pt}{14pt}\selectfont}
  \newcommand{\lsSpineTitleFont}{\sffamily\fontsize{18pt}{14pt}\selectfont}

\setkomafont{sectioning}{\normalcolor\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Colors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xcolor}
\definecolor{lsLightBlue}{cmyk}{0.6,0.05,0.05,0}
\definecolor{lsMidBlue}{cmyk}{0.75,0.15,0,0}
\definecolor{lsMidDarkBlue}{cmyk}{0.9,0.4,0.05,0}
\definecolor{lsDarkBlue}{cmyk}{0.9,0.5,0.15,0.3}
\definecolor{lsNightBlue}{cmyk}{1,0.47,0.22,0.68}
\definecolor{lsYellow}{cmyk}{0,0.25,1,0}
\definecolor{lsLightOrange}{cmyk}{0,0.50,1,0}
\definecolor{lsMidOrange}{cmyk}{0,0.64,1,0}
\definecolor{lsDarkOrange}{cmyk}{0,0.78,1,0}
\definecolor{lsRed}{cmyk}{0.05,1,0.8,0}
\definecolor{lsLightWine}{cmyk}{0.3,1,0.6,0}
\definecolor{lsMidWine}{cmyk}{0.54,1,0.65,0.1}
\definecolor{lsDarkWine}{cmyk}{0.58,1,0.70,0.35}
\definecolor{lsSoftGreen}{cmyk}{0.32,0.02,0.72,0}
\definecolor{lsLightGreen}{cmyk}{0.4,0,1,0}
\definecolor{lsMidGreen}{cmyk}{0.55,0,0.9,0.1}
\definecolor{lsRichGreen}{cmyk}{0.6,0,0.9,0.35}
\definecolor{lsDarkGreen1}{cmyk}{0.85,0.02,0.95,0.38}
\definecolor{lsDarkGreen2}{cmyk}{0.85,0.05,1,0.5}
\definecolor{lsNightGreen}{cmyk}{0.88,0.15,1,0.66}
\definecolor{lsLightGray}{cmyk}{0,0,0,0.17}
\definecolor{lsGuidelinesGray}{cmyk}{0,0.04,0,0.45}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Special commands for authors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% defaults:
\newcommand{\lsBackBody}{Europan lingues es membres del sam familie. Lor separat existentie es un
myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li
lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe
al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.}
\newcommand{\lsBackTitle}{Back Title}

\newcommand{\BackTitle}[1]{\renewcommand{\lsBackTitle}{#1}}
\newcommand{\BackBody}[1]{\renewcommand{\lsBackBody}{#1}} 

\newcommand{\newlineCover}{\\}	% \newline only on cover
\newcommand{\newlineSpine}{\\}	% \newline only on spine
\newcommand{\newlineTOC}{\\}		% \newline only in TOC entry

\newcommand{\lsSpineTitle}{\@title}
\newcommand{\lsSpineAuthor}{\@author}
\newcommand{\SpineTitle}[1]{\renewcommand{\lsSpineTitle}{#1}}
\newcommand{\SpineAuthor}[1]{\renewcommand{\lsSpineAuthor}{#1}} 

\def\translator#1{\gdef\@translator{#1}}
\translator{}
\def\typesetter#1{\gdef\@typesetter{#1}}
\typesetter{}
\def\proofreader#1{\gdef\@proofreader{#1}}
\proofreader{}
%\def\@author{\@latex@warning@no@line{No \noexpand\author given}}


\newcommand{\ISBN}[1]{\renewcommand{\lsISBN}{#1}}
\newcommand{\URL}[1]{\renewcommand{\lsURL}{#1}}
\newcommand{\Series}[1]{\renewcommand{\lsSeries}{#1}}
\newcommand{\SeriesNumber}[1]{\renewcommand{\lsSeriesNumber}{#1}}

% for papers of collections:
\newcommand{\lsCollectionPaperAbstract}{Put abstract here with \string\abstract.}
\newcommand{\abstract}[1]{\renewcommand{\lsCollectionPaperAbstract}{#1}}

\def\epigram#1{\gdef\@epigram{#1}}			% needs to be defined this way to check emptiness
\epigram{}
\def\epigramsource#1{\gdef\@epigramsource{#1}}
\epigramsource{}

% inside \author
\renewcommand{\and}{}				
\newcommand{\lastand}{}
\newcommand{\affiliation}[1]{}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Series information:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\eotms}{eotms}
\newcommand{\eotmsig}{eotmsig}
\newcommand{\sidl}{sidl}
\newcommand{\algad}{algad}
\newcommand{\tmnlp}{tmnlp}
\newcommand{\nc}{nc}		%Niger Congo
\newcommand{\tbls}{tbls}	%Lecture Notes in Language Sciences
\newcommand{\silp}{silp}	%Studies in Laboratory Phonology
\newcommand{\tdgi}{tdgi}	%Topics at the Discourse Grammar Interface
\newcommand{\cmle}{cmle}	%Computational Models of Language Evolution
\newcommand{\cfls}{cfls}	%Conceptual Foundation of the Language Sciences
\newcommand{\lv}{lv}		%Language Variation
\newcommand{\dummyseries}{dummyseries}
\newcommand{\guidelines}{guidelines}
\newcommand{\lsSeriesFontColor}{white}

\AtBeginDocument{
\ifx\lsSeries\eotms
	\newcommand{\lsSeriesTitle}{Empirically Oriented Theoretical \newlineCover Morphology and Syntax~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\eotmsig
	\newcommand{\lsSeriesTitle}{Implemented Grammars~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\sidl
	\newcommand{\lsSeriesTitle}{Studies in Diversity Linguistics~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsRichGreen}
	\renewcommand{\lsISSN}{2363-5568}
\fi
\ifx\lsSeries\algad
	\newcommand{\lsSeriesTitle}{African Language Grammars \newlineCover and Dictionaries~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsLightOrange}
\fi
\ifx\lsSeries\scl
	\newcommand{\lsSeriesTitle}{Studies in Caribbean Languages~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsDarkOrange}
\fi
\ifx\lsSeries\tmnlp
	\newcommand{\lsSeriesTitle}{Translation and Multilingual Natural \newlineCover Language Processing~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsDarkBlue}
\fi
\ifx\lsSeries\tbls
	\newcommand{\lsSeriesTitle}{Textbooks in Language Sciences~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsYellow}
\fi	
\ifx\lsSeries\nc
	\newcommand{\lsSeriesTitle}{Monographs on Comparative Niger-Congo~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsRed}
\fi	
\ifx\lsSeries\silp
	\newcommand{\lsSeriesTitle}{Studies in Laboratory Phonology~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsLightWine}
	\renewcommand{\lsISSN}{2363-5576}
\fi	
\ifx\lsSeries\tdgi
	\newcommand{\lsSeriesTitle}{Topics at the Discourse Grammar Interface~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidDarkBlue}
\fi	
\ifx\lsSeries\cmle
	\newcommand{\lsSeriesTitle}{Computational Models of Language Evolution~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsNightBlue}
\fi	
\ifx\lsSeries\cfls
	\newcommand{\lsSeriesTitle}{Conceptual Foundations of \newlineCover Language Science~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsNightGreen}
\fi	
\ifx\lsSeries\lv
	\newcommand{\lsSeriesTitle}{Language Variation~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsDarkWine}
\fi	
\ifx\lsSeries\dummyseries
	\newcommand{\lsSeriesTitle}{~}
	\newcommand{\lsSeriesColor}{lsNightGreen}
\fi
\ifx\lsSeries\guidelines
	\newcommand{\lsSeriesTitle}{Language Science Press Guidelines}
	\newcommand{\lsSeriesColor}{lsGuidelinesGray}
	\renewcommand{\lsCoverFontColor}{black}
\fi
}	

% \@ifundefined{blackandwhite}
% 	{}
% 	{\renewcommand{\lsSeriesColor}{black}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Header and footer:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{datetime}
\usepackage{scrpage2}
\ohead{\headmark}
\ihead{}
\cfoot{}
\ofoot[]{\pagemark}
\iflsDraft
  \ifoot{Draft of \today, \currenttime}
\fi
%% \ihead{\upshape{\headmark}}
%% \ohead{\pagemark}
%% \cfoot{}
%% \ifoot[]{}
%% \ofoot{\upshape{Draft of \today, \currenttime}}


\renewcommand*{\partpagestyle}{empty}

\pagestyle{scrheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Citation:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Xelatex likes this, must appear before BibLaTeX:
\usepackage[hyphens]{url}
\urlstyle{same}

\iflsBiblatex	% BibLaTeX
	\usepackage[
		natbib=true,
		style=LSP/lsp-bst/biblatex-sp-unified,
		citestyle=LSP/lsp-bst/sp-authoryear-comp,
		%refsection=chapter,
		maxbibnames=99,
		isbn=false,
		doi=false,
		eprint=false,
		backend=\lsBiblatexBackend,
		indexing=cite
		]{biblatex}
	\renewcommand{\postnotedelim}{: }%
	\renewcommand{\multicitedelim}{\addsemicolon\space}%  
	\DeclareFieldFormat{postnote}{#1}%
	%\renewcommand{\nameyeardelim}{ }%		
\else	%BibTeX
	\usepackage{natbib}
	\setlength{\bibsep}{0mm}
	% unified style sheet for linguistics journals
	% put directory in BST_INPUTS
	% http://celxj.org/downloads/unified.bst
	\bibliographystyle{./LSP/lsp-bst/unified} 
	% This does not work ...
	%% \setcitestyle{
	%% notesep={: }, % 2002: 125
	%% aysep={~}     % Gazdar 2002
	%% }

	% check what the unified people have to say on this.
	\bibpunct[: ]{(}{)}{;}{a}{}{,}
	% They do not say anything about citations in the running text.
	% As was sown in \citew{Meier2002} -> As was shown in Meier (2002), ...
	% This is what De Gruyter does:
	\let\citew=\citet
	% This is what Stefan did:
	%\let\citew=\citealt
\fi

% penalties against widows and orphans in bibliography
% http://tex.stackexchange.com/questions/51257/how-can-i-force-bibliography-items-not-to-be-split-across-pages
\usepackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
    \clubpenalty10000
    \@clubpenalty \clubpenalty
    \widowpenalty10000}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Floats:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{floatrow}					% For adjusting the position of the caption (default is below).
\floatsetup[table]{capposition=top} 	% As for tables, the caption appears above.

% This sets the default for the positioning of floats
\renewcommand{\fps@figure}{htbp}
\renewcommand{\fps@table}{htbp}

\usepackage{booktabs} %for nicer lines

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Indexes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\iflsIndex
\usepackage{index}
% Wie im Stylefile, aber ohne \MakeUppercase
   \renewenvironment{theindex}{%
		\edef\indexname{\the\@nameuse{idxtitle@\@indextype}}%
		\if@twocolumn
			\@restonecolfalse
		\else
			\@restonecoltrue
		\fi
		\columnseprule \z@
		\columnsep 35\p@
		\twocolumn[%
			\@makeschapterhead{\indexname}%
			\ifx\index@prologue\@empty\else
				\index@prologue
				\bigskip
			\fi
		]%
%        \@mkboth{\MakeUppercase\indexname}%
%                {\MakeUppercase\indexname}%
		\@mkboth{\indexname}%
				{\indexname}%
		\thispagestyle{plain}%
		\parindent\z@
		\parskip\z@ \@plus .3\p@\relax
		\let\item\@idxitem
	}{%
		\if@restonecol
			\onecolumn
		\else
			\clearpage
		\fi
	}

\makeindex
\newindex{lan}{ldx}{lnd}{Language index}
% \newindex{aut}{adx}{and}{Name index}
\newindex{sbj}{sdx}{snd}{Subject index}
\renewindex{default}{adx}{and}{Name index} %biblatex can only deal with the default index
\newindex{wrd}{wdx}{wnd}{Expression index}
\newindex{rwrd}{rdx}{rnd}{Reverse expression index}

\indexproofstyle{\setlength{\overfullrule}{0pt}\raggedright\footnotesize}

\def\fn#1#2{%
\hyperpage{#2}$^{#1}$%
}%
\fi

\newcommand{\ia}[1]{\if@noftnote%
\index{#1}%
\else%
\index{#1|fn{\thefootnote}}%
\fi%
}

\newcommand{\is}[1]{\if@noftnote%
\index[sbj]{#1}%
\else%
% irgendwie muss man ihn dazu bringen den Wert für footnote auch einzusetzen
\index[sbj]{#1|fn{*}}%
%\indexftn{#1}{\value{footnotemark}}%
\fi%
}

\newcommand{\isfeat}[1]{\if@noftnote%
\index{feature!{\sc #1}}%
\else%
%\index{feature!{\sc #1}|fn{\thefootnote}}%
\index{feature!{\sc #1}|fn{*}}%
\fi%
}

\newcommand{\istype}[1]{\if@noftnote%
\index{type!#1@\type{#1}}%
\else%
%\index{type!{\it #1}|fn{\thefootnote}}
\index{type!#1@\type{#1}|fn{*}}%
\fi%
}

\newcommand{\isrel}[1]{\if@noftnote%
\index{relation!\emph{#1}}%
\else%
\index{relation!\emph{#1}|fn{*}}%
\fi%
}


% \index[lan] für Einträge in separaten Index

\newcommand{\il}[1]{%
\if@noftnote%
\index[lan]{#1}%
\else%
\index[lan]{#1|fn{*}}%
\fi%
}

% index entries for words
\newcommand{\iw}[1]{%
\if@noftnote%
\index[wrd]{#1}%
\else%
\index[wrd]{#1|fn{*}}%
\fi%
}


% \iflsDraft
%   \usepackage{showidx} 	% Doesn't work with multiple indexes?
% \fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Hyperref:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\usepackage[
	bookmarks=true,bookmarksopen=true,bookmarksopenlevel=1,%
	bookmarksdepth=5,
	hyperindex=true,%
	breaklinks=true,
	draft=false,
	plainpages=false,
	pdfusetitle=true,  % puts author and title in automatically, maybe only in final mode?
	pdfkeywords={},
	pdfpagelayout=TwoPageRight,   % first page is separate
	%ps2pdf=true
	]{hyperref}

%\KOMAoptions{footnotes=multiple}

% xelatex hates this.
%\usepackage{breakurl} 	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Cover:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\usepackage[ISBN=\lsISBN,SC4]{ean13isbn}	% for generating bar codes; remove this?
\usepackage{pst-barcode}					% for generating bar codes
\newcommand{\logopath}{./LSP/lsp-logos}
\newcommand{\lsCoverFontColor}{white}
\newcommand{\lsCoverBlockColor}{\lsSeriesColor}
\newcommand{\lsEditorPrefix}{}
\newcommand{\lsEditorSuffix}{}   

\iflsCollection  	% for collections: set \lsEditorSuffix depending on \@author
\AtBeginDocument{	
	\IfSubStr{\@author}{\&}	 	% if \@author contains \&
		{\renewcommand{\lsEditorSuffix}{(eds.)}}
		{\IfSubStr{\@author}{,}	% if \@author contains ,
			{\renewcommand{\lsEditorSuffix}{(eds.)}}
			{\renewcommand{\lsEditorSuffix}{(ed.)}}}
}
\else
\fi

\newcommand{\lsCoverBlock}{
	\begin{textblock}{155}(7.6,7.5)
	\color{\lsCoverBlockColor}
	\raggedright\rule{155mm}{225mm}
	\end{textblock}
	\iflsDraft
	   \begin{textblock}{155}(30,80)
		 \color{lsLightGray}
		 \rotatebox{40}{
			\begin{tabular}{c}
			\scalebox{10}{DRAFT}\\
			of \today, \currenttime
			\end{tabular}}
	   \end{textblock}
	\fi}

\newcommand{\lsCoverTitleAuthor}{
	\renewcommand{\newlineCover}{\\}
	\renewcommand{\newlineSpine}{}
	\lsCoverBlock

	\begin{textblock}{140}(15,17.5)
	\color{\lsCoverFontColor}
	\raggedright
	{\lsCoverTitleFont{\@title\\}}

	\ifx\@subtitle\empty
	\else \vspace{8mm} {\lsCoverSubTitleFont \@subtitle\\}
	\fi

	\vspace{11.2mm} % 20mm - 25pt
 
	\raggedright
	{\lsCoverAuthorFont 
		\lsEditorPrefix\@author\\}
	\end{textblock}}

\newcommand{\lsCoverSeries}{
	\begin{textblock}{95}(7.4,209)
	\color{white}
	\raggedright\rule{3.6mm}{3.5mm}
	\color{\lsCoverFontColor}
	\hspace{3mm}\parbox[t]{85mm}{\raggedright\lsCoverSeriesFont   
		\lsSeriesTitle\\}
	\end{textblock}}

\newcommand{\lsCoverLogo}{		
	\begin{textblock}{33}(124.6,205)
		\raggedright\IfFileExists{\logopath/langsci_logo_nocolor.pdf}{\includegraphics{\logopath/langsci_logo_nocolor.pdf}}{langsci logo}  
	\end{textblock}}

\newcommand{\lsFrontPage}{		% Front page
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverSeries
	\lsCoverLogo}

\newcommand{\lsSchmutztitel}{	% Schmutztitel
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverLogo}

\newcommand{\lsBackPage}{		% Back page
	\lsCoverBlock

	\begin{textblock}{115}(15,24)  % 30mm-6mm
	\color{white}
	{\raggedright
	 \lsBackTitleFont 
	 \lsBackTitle \\ \null} 

	\lsBackBodyFont

	\noindent 
	\lsBackBody
	\end{textblock}

	\begin{textblock}{40}(105,200)
	\lsBackBodyFont\sffamily
	\colorbox{white}{%
	\begin{pspicture}(0,0)(4.1,1in)
	\psbarcode[transx=0.4,transy=0.3]{\lsISBN}{includetext height=0.7}{isbn}
	\end{pspicture}
	%\EANisbn%			% remove this?
	%{\EAN \lsISBN }  	% bar code without isbn line
	}%	
	\end{textblock}}

\newcommand{\lsSpine}{			% Book spine
	\renewcommand{\newlineSpine}{\\}
	\renewcommand{\newlineCover}{}
	\begin{textblock}{40}(65,0)
	\rotatebox{90}{\color{black}\begin{minipage}[c][\lsSpineBreadth][c]{\paperheight}
		\color{\lsSeriesColor}
		\hspace{7.5mm}
		\IfFileExists{\logopath/langsci_spinelogo_nocolor.pdf}{$\vcenter{\hbox{\includegraphics[angle=-90,origin=c]{\logopath/langsci_spinelogo_nocolor.pdf}}}$}{logo}
		\hspace{15mm} 
		{\lsSpineTitleFont
			\rotatebox[origin=c]{180}{\pbox[c]{150mm}{\lsSpineTitle}}}
		\hspace{13mm}
		{\lsSpineAuthorFont 
			\rotatebox[origin=c]{180}{\pbox[c]{100mm}{\lsSpineAuthor\if\lsEditorSuffix\empty\else\ \lsEditorSuffix\fi}}}
	\end{minipage}} 
	\end{textblock}}


\newcommand{\onlyAuthor}{%		% collection paper
	\renewcommand{\and}{, }% 
	\renewcommand{\lastand}{ \& }%  
	\renewcommand{\affiliation}[1]{}}
\newcommand{\AuthorAffiliation}{
	\renewcommand{\and}{\newline\newline} 
	\renewcommand{\lastand}{\newline\newline} 
	\renewcommand{\affiliation}[1]{\\[0.5ex]{\large ##1}}}
\newcommand{\lsCollectionPaperHeaderAuthor}{{%
	\renewcommand{\newlineCover}{}%
	\renewcommand{\newlineTOC}{}%
	\onlyAuthor\@author}}
\newcommand{\lsCollectionPaperHeaderTitle}{%
	\renewcommand{\newlineCover}{}
	\renewcommand{\newlineTOC}{}
	\iflsCollectionChapter%
		\thechapter\hspace{0.5em}\fi
	\@title}
\newcommand{\lsCollectionPaperTOC}{{%
	\iflsCollectionChapter%
		\protect\numberline{\thechapter}\fi
	\@title\newline{\normalfont\@author}}}
\newcommand{\lsCollectionPaperTitle}{{%
	\renewcommand{\newlineTOC}{}
	\renewcommand{\newlineCover}{\\}
	\iflsCollectionChapter 
		{\LARGE Chapter \thechapter}\newline\newline\fi
	\@title}}
\newcommand{\lsCollectionPaperAuthor}{{%
	\renewcommand{\newlineTOC}{}
	\renewcommand{\newlineCover}{\\[0.5ex]}
	\AuthorAffiliation\LARGE\@author}}
\newcommand{\lsCollectionPaperCitation}{\scalebox{1.2}{
	\includegraphics{\logopath/langsci_spinelogo_nocolor.pdf}}%
	\hspace{0.8em}%
	\parbox[b]{.85\textwidth}{\linespread{0.8}\small\normalfont\lsCollectionPaperCitationText}}
\newcommand{\lsCollectionPaperCitationText}{\string\lsCollectionPaperCitationText.}
\newcommand{\lsPaper}{
	\renewcommand{\maketitle}{
		\addtocounter{chapter}{1}
		\addchap*{\lsCollectionPaperTitle}
		\global\edef\lsCollectionPaperFirstPage{\thepage}	% for citation in footer
		\onlyAuthor
		\renewcommand{\newlineCover}{}
		\renewcommand{\newlineTOC}{\\}
		\addcontentsline{toc}{chapter}{\lsCollectionPaperTOC}%
		\ifoot[\lsCollectionPaperCitation]{\iflsDraft Draft of \today, \currenttime \fi}
		\vspace*{-2ex}
		\lsCollectionPaperAuthor%
		\vspace*{\baselineskip}%
		\ifx\@epigram\empty%
			\else {\epigraph{\@epigram\\[-5ex]}{\@epigramsource}% 
					\epigram{}\epigramsource{}}% 
		\fi% 
		\begin{quote}
		\small\lsCollectionPaperAbstract
		\end{quote}
	}	

	\renewcommand*{\thesection}{\arabic{section}}
	\setcounter{section}{0}
	\setcounter{footnote}{0}
	\setcounter{figure}{0}
	\setcounter{table}{0}
	\setcounter{equation}{0}  % for examples
	\ohead{}
	\lehead{\lsCollectionPaperHeaderAuthor}
	\rohead{\lsCollectionPaperHeaderTitle}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Ouput types:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsOutputLong}{long}
\newcommand{\lsOutputShort}{short}
\newcommand{\lsOutputInprep}{inprep}
\newcommand{\lsOutputPaper}{paper}
\newcommand{\lsOutputGuidelines}{guidelines}


\AtBeginDocument{
\ifx\lsOutput\lsOutputPaper				% only if output=paper
	\usepackage{chngcntr}
	\counterwithout{figure}{chapter}
	\counterwithout{table}{chapter}
	\lsPaper
\else									% only if output!=paper
\renewcommand{\maketitle}{
\begin{titlepage}
\thispagestyle{empty}

\ifx\lsOutput\lsOutputLong				% only if output=long
	\setcounter{page}{-3}
	% First titlepage:
	{\lsFrontPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Back page:
	{\lsBackPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Book spine:
	{\lsSpine}
	%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Series information:
	{\lsSeriesHistory}
	%%%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	% Schmutztitel:
	{\renewcommand{\lsCoverBlockColor}{white}
	 \renewcommand{\lsCoverFontColor}{\lsSeriesColor}
	\lsSchmutztitel}
	%%%%%%%%%%%%%%%%%%%%
\fi		

\ifx\lsOutput\lsOutputShort						% only if output=short
	\setcounter{page}{-1}
	% First titlepage:
	{\lsFrontPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Series information:
	{\lsSeriesHistory}
	%%%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	% Schmutztitel:
	{\renewcommand{\lsCoverBlockColor}{white}
	 \renewcommand{\lsCoverFontColor}{\lsSeriesColor}
	\lsSchmutztitel}
	%%%%%%%%%%%%%%%%%%%%
	\AtEndDocument{
		\null\newpage\thispagestyle{empty}
		% Back page:
		{\lsBackPage}
		\null\newpage\thispagestyle{empty}
	}
\fi

\ifx\lsOutput\lsOutputInprep					% only if output=inprep
	{\renewcommand{\lsCoverBlockColor}{white}
	 \renewcommand{\lsCoverFontColor}{black}
	 \lsCoverBlock
	 \lsCoverTitleAuthor}
\fi								

\ifx\lsOutput\lsOutputGuidelines				% only if output=guidelines
	{\setcounter{page}{-1}
	% First titlepage:
	{\lsFrontPage}}
\fi	

\end{titlepage}

\frontmatter
\renewcommand{\frontmatter}{}

\null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} 	% for hyperref
\color{black}
\lsInsideFont

% Imprint:
\ifx\lsOutput\lsOutputInprep{}
\else{
	\ifx\lsOutput\lsOutputGuidelines{}
	\else{\lsImpressum}
	\fi}
\fi
%%%%%%%%%%%%%

\null\newpage\thispagestyle{plain}
%\pagenumbering{roman}		% or \frontmatter

% Dedication:
\ifx\@dedication\empty{}
\else{\lsDedication}
\fi
%%%%%%%%%%%%%%%%

}	% \maketitle
\fi

% for those who like the example in numbered example sentences to be typeset in italics
% this is possible for a complete series only.
\ifx\lsSeries\sidl
	\AtBeginDocument{
	%\def\exfont{\normalsize\itshape}
	\renewcommand{\eachwordone}{\itshape} 
	}
\fi


}	% \AtBeginDocument



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Series history:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsSeriesHistory}{
\color{black}
\raggedright\lsCoverSeriesHistoryFont

\IfFileExists{./LSP/lsp-seriesinfo/\lsSeries-info.tex}{\input{./LSP/lsp-seriesinfo/\lsSeries-info}}{
  Series information: ./LSP/lsp-seriesinfo/\lsSeries-info.tex not found!} 

\IfStrEq{\lsISSN}{??}		% \IfStrEq from xstring
	{}
	{\vfill\hfill ISSN: \lsISSN}

}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Imprint:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsImpressumCitationText}{
	\renewcommand{\newlineCover}{}
	\renewcommand{\newlineSpine}{}
	{\@author}\if\lsEditorSuffix\empty\else\ \lsEditorSuffix\fi. %
	{\the\year}. %
	\textit{\@title}\if\@subtitle\empty\else: \textit{\@subtitle}\fi\ %
	(\lsSeriesTitle). %
	Berlin: Language Science Press.
}

\newcommand{\lsImpressum}{
\raggedright

\lsImpressumCitationText

\vfill

This title can be downloaded at:\\
\url{\lsURL}

© \the\year, \iflsCollection the authors\else\@author\fi

\newcommand{\ccby}{CC-BY} 
\ifx\lsCopyright\ccby 
Published under the Creative Commons Attribution 4.0 Licence (CC BY 4.0):
http://creativecommons.org/licenses/by/4.0/ 
\else
Published under the Creative Commons Attribution-NoDerivatives 4.0 Licence (CC BY-ND 4.0):
http://creativecommons.org/licenses/by-nd/4.0/ 
\fi
 
ISBN: \lsISBN \\
\IfStrEq{\lsISSN}{??}		% \IfStrEq from xstring
	{}
	{ISSN: \lsISSN}

\bigskip
 
Cover and concept of design:
Ulrike Harbort \\
\if\@translator\empty\else
Translator:
\@translator \\
\fi
\if\@typesetter\empty\else
Typesetting:
\@typesetter \\
\fi
\if\@proofreader\empty\else
Proofreading:
\@proofreader \\
\fi
Fonts: Linux Libertine, Arimo \\
Typesetting software: \XeLaTeX

\bigskip

Language Science Press\\
Habelschwerdter Allee 45\\
14195 Berlin, Germany\\
\href{http://langsci-press.org}{langsci-press.org}

\vfill

Storage and cataloguing done by FU Berlin \\[3ex]  	

\IfFileExists{\logopath/FULogo_sw_CMYK.pdf}{\includegraphics[width=5cm]{\logopath/FULogo_sw_CMYK.pdf}}{FU-Logo} \\[3ex]

\vfill

\noindent
\lsp has no responsibility for the persistence or accuracy of URLs for
external or third-party Internet websites referred to in this
publication, and does not guarantee that any content on such websites
is, or will remain, accurate or appropriate. Information regarding
prices, travel timetables and other factual information given in this
work are correct at the time of first publication but \lsp does not
guarantee the accuracy of such information thereafter. 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Dedication:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsDedication}{
	\vspace*{.2\textheight}	
	\begin{center}
		{\lsDedicationFont
		 \@dedication }
	\end{center}
	\vfill
	\clearpage}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Footnotes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifxetex
\addtokomafont{footnote}{\addfontfeatures{Numbers=Lining}} 			% numbers in footnotes
%\addtokomafont{footnotelabel}{\addfontfeatures{Numbers=Lining}} 	% numbers in footnote labels
%\addtokomafont{footnotereference}{\addfontfeatures{Numbers=Lining}} 	% numbers in footnote references
\fi

\raggedbottom
\deffootnote[1.5em]{1.5em}{0mm}{\textsuperscript{\thefootnotemark}\ }

\KOMAoptions{footnotes=multiple}

% http://tex.stackexchange.com/questions/28465/multiple-footnotes-at-one-point/71015#71015
\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
	\oldFootnote{#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
	\ifx\footnote\nextToken\textsuperscript{,}\fi}

%\deffootnote{1.5em}{1em}{% 
%    \makebox[1.5em][l]{\thefootnotemark}}

%% % this should be removed here, temporary
%% \newif\if@noftnote\@noftnotetrue
%% \newif\if@xrec\@xrecfalse
%% \@definecounter{fnx}

%% %%%% adapted from latex.tex to get examples in footnotes right
%% \long\def\@footnotetext#1{%
%%     \@noftnotefalse\setcounter{fnx}{0}%
%%     \insert\footins{\reset@font\footnotesize
%%     \interlinepenalty\interfootnotelinepenalty
%%     \splittopskip\footnotesep
%%     \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
%%     \hsize\columnwidth \@parboxrestore
%%    \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
%%     {\rule{\z@}{\footnotesep}\ignorespaces
%%       #1\strut}}\@noftnotetrue}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Collection:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\iflsCollection
	\iflsBiblatex\else
		\ClassError{LSP/langsci}{Collection option not compatible with plain BibTeX. Please use biblatex option}{}
	\fi
	
\renewcommand{\lsEditorPrefix}{{\LARGE Edited by}\\}
\AtBeginDocument{	% for the citation in the footer
	\renewcommand{\newlineCover}{}
	\renewcommand{\newlineSpine}{} 
	\edef\lsCollectionTitle{\@title}		% \edef immediately expands \@title
	\edef\lsCollectionEditor{\@author}
	\addbibresource{collection_tmp.bib}
	\newwrite\tempfile						% open temporary bib file
	\immediate\openout\tempfile=collection_tmp.bib
}
\AtEndDocument{\immediate\closeout\tempfile}% close temporary bib file

%% customize \tableofcontents
\renewcommand{\@dotsep}{2.5}		% space between dots
\renewcommand{\@tocrmarg}{1.5em}	% right margin for leader 
\renewcommand{\@pnumwidth}{1.5em}	% width of page numbers
\usepackage{tocstyle}
\usetocstyle{standard}				%\usetocstyle{allwithdot}
\iflsCollectionTOCLong\else
	\setcounter{tocdepth}{0}\fi			% show only parts and chapters
\settocstylefeature[-1]{pagenumberbox}{\csname @gobble\endcsname}	% parts without page number
\settocstylefeature[-1]{leaders}{\hfill}							% parts without dots#
	
\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

%% Modified code from:
%% http://pastcounts.wordpress.com/2010/12/20/how-to-construct-a-collection-of-articles-with-latex/
\newenvironment{collectionpaper}{
	\renewcommand{\documentclass}[2][]{}%
	\renewcommand{\usepackage}[2][]{}%
	\renewenvironment{document}{\begingroup}{\endgroup}%

	\renewcommand{\title}[1]{\renewcommand{\@title}{##1}}
	\renewcommand{\author}[1]{\renewcommand{\@author}{##1}}
	%\renewcommand{\thanks}[1]{\symbolfootnote[1]{##1}}
	\lsPaper
	}
	{}

\newcommand{\includepaper}[1]{
	\begin{collectionpaper}
	\begin{refsection}

	\DeclareCiteCommand{\fullciteFooter}
		{\defcounter{maxnames}{\blx@maxbibnames}%
		  \usebibmacro{prenote}}
		{\usedriver
		   {\DeclareNameAlias{sortname}{default}}
		   {\thefield{entrytype}}}
		{\multicitedelim}
		{\usebibmacro{postnote}}
	\renewcommand{\lsCollectionPaperCitationText}{\fullciteFooter{#1}} 
	
	\include{#1}%
	\edef\lsCollectionPaperLastPage{\thepage}	% \lsCollectionPaperFirstPage is defined in \lsPaper

	%%% for citation in footer
	%% preprocessing of author/editor names
	\onlyAuthor		
	\renewcommand{\newlineCover}{}
	\renewcommand{\newlineSpine}{}
	\renewcommand{\newlineTOC}{}
	\StrSubstitute{\@author}{,}{ and }[\authorTemp]
	\StrSubstitute{\authorTemp}{\&}{ and }[\authorTemp]
	\StrSubstitute{\lsCollectionEditor}{,}{ and }[\editorTemp]
	\StrSubstitute{\editorTemp}{\&}{ and }[\editorTemp]

	%% write bib entry to file
	\immediate\write\tempfile{@incollection{#1,author={\authorTemp},title={\@title},booktitle={\lsCollectionTitle},editor={\editorTemp},publisher={Language Science Press},Address={Berlin},year=2014,pages={\lsCollectionPaperFirstPage --\lsCollectionPaperLastPage},options={skipbib=true}}}

	%\printbibliography[heading=subbibliography,notkeyword=this]  
	\end{refsection}
	\end{collectionpaper}}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    subsubsubsection:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{4} % und (f"urs Inhaltsverzeichnis)
% \setcounter{tocdepth}{4} (oder so) angegeben werden.

\def\subsubsubsection{\@startsection{paragraph}{3}{\z@}{-3.25ex plus
	-1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}
%
\let\subsubsubsectionmark\@gobble
%

\def\subsubsubsubsection{\@startsection{subparagraph}{3}{\z@}{-3.25ex plus
	-1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}
%
\let\subsubsubsubsectionmark\@gobble
% needed for hyperref
\def\toclevel@subsubsubsection{4}
%    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Miscellaneous:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% bidi has to be loaded in the individual documents
%\ifxetex
%\usepackage{bidi} 		% wants to be placed below hyperref, natbib, graphicx, ...
%\fi

\usepackage[figuresright]{rotating}

% gets rid of the warnings:
% Failed to convert input string to UTF16
% http://tex.stackexchange.com/questions/66722/tex-live-2012-xelatex-moderncv-error-failed-to-convert-input-string-to-utf1
\hypersetup{unicode,pdfencoding=auto,bookmarksopenlevel=0}
 
% this is required by authorindex
\newif\ifshowindex \showindexfalse

\usepackage{authorindex}

% lsp-eng-hyp is a makeshift package. Authors should use localhyphenation.sty
% \usepackage{./LSP/lsp-styles/lsp-eng-hyp}

% mex considered evil. We need explicit references to examples for XML conversion, but mex does not provide them
% The following allows for a quick reference to following or preceeding examples (\mex{1}) or
% (\mex{0}) but also (\mex{-1})
% taken from covington.sty (check)
% \newcounter{lsptempcnt}
% 
% \newcommand{\mex}[1]{\setcounter{lsptempcnt}{\value{equation}}%
% \addtocounter{lsptempcnt}{#1}%
% \arabic{lsptempcnt}}%

% quotes are indented at one side only.
\renewenvironment{quote}
			   {\list{}{\rightmargin0pt\leftmargin8mm}%{\rightmargin\leftmargin}%
				\item\relax}
			   {\endlist}

% quotations are indented at one side only
% there is no indentation at the beginning of the quote
\renewenvironment{quotation}
			   {\list{}{\listparindent 1.5em%
						%\itemindent    \listparindent
						%\rightmargin   \leftmargin
						\parsep        \z@ \@plus\p@}%
				\item\relax}
			   {\endlist}

% varioref considered evil. We willh ave various output formats, and we do not know, where elements will be placed in all of them
% \usepackage[english]{varioref}


% useful commands for glossings:
\usepackage{./LSP/lsp-styles/lsp-lgr}

\newlength{\LSPTmp}
% a) hspace over width of something without showing it
\newcommand*{\hspaceThis}[1]{\settowidth{\LSPTmp}{#1}\hspace*{\LSPTmp}}

%%% epigraph configuration
\usepackage{epigraph}
\setlength{\epigraphrule}{0pt}
\renewcommand{\textflush}{flushepinormal}
%\setlength{\epigraphwidth}{.2\textwidth}
\setlength{\afterepigraphskip}{0\baselineskip}

\usepackage{./LSP/lsp-styles/lsp-makros}

\endinput
