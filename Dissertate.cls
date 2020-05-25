% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, openany, a4paper]{book}

%
% Options
%
\RequirePackage{etoolbox}
\RequirePackage{acro}
\RequirePackage{siunitx}

%Hyphenation rules
\hyphenation{smRNA}
\hyphenation{smRNAs}
\hyphenation{mRNA}
\hyphenation{mRNAs}
\hyphenation{miRNA}
\hyphenation{miRNAs}
\hyphenation{miRNeo}
\hyphenation{miRNet}
\hyphenation{homo-pen-ta-mer-ic}
\hyphenation{mito-chon-dri-al}
\hyphenation{lipo-poly-sac-cha-ri-de}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\toggletrue{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.4}
    \newcommand{\dcompressedspacing}{1.2}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[a4paper, left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm, bindingoffset=3mm]{geometry}
\usepackage{ragged2e}
%\RaggedRight
\justifying
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

\RequirePackage{listings}

% Fonts.
\RequirePackage{color}
\RequirePackage[dvipsnames]{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=Lining, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={justified},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}


% Headings and headers.
% semibold https://tex.stackexchange.com/questions/264265/defining-subfamilies-for-a-font/264275#264275
\RequirePackage{fontspec}
\setmainfont{EB Garamond}[FontFace={mb}{n}{*-Medium}]
\DeclareRobustCommand\mbseries{\fontseries{mb}\selectfont}
\DeclareTextFontCommand{\textmb}{\mbseries}

\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\titleformat{\section}
	{\normalfont\large\mbseries\scshape}{\thesection.}{1em}{}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[super,comma,numbers,sort&compress]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}

%lstlisting definitions
\definecolor{dkgreen}{RGB}{0,130,0}
\definecolor{dkblue}{RGB}{0,20,180}
\definecolor{gray}{RGB}{150,150,150}
\definecolor{mauve}{RGB}{180,0,180}
\lstset{frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=left,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{dkblue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}
\lstdefinelanguage{Cypher}{
  morecomment=[l]{//},
  morekeywords={MATCH,WITH,RETURN,WHERE,IN,AND,AS,TRUE,FALSE,count,type},
  sensitive=true,
  morestring=[b]'
}


% School color 
\definecolor{SchoolColor}{rgb}{0.15, 0.38, 0.61} % Lapis lazuli
\definecolor{chaptergrey}{rgb}{0.15, 0.38, 0.61} % for chapter numbers

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}
\urlstyle{same}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
	\input{frontmatter/personalize}
	\maketitle
	\formalpage
	\copyrightpage
	\abstractpage
    	\contentspage
	\preamble
	% \listoffigures % optional
	\dedicationpage
	\acknowledgments
	\abbreviations
}

\renewcommand{\maketitle}{
    \pagenumbering{roman}
    %\setcounter{page}{1}
	\thispagestyle{empty}
	\vspace*{\fill}
	\vspace{-50pt}
	\begin{center}
		\fontsize{35}{45}\selectfont \textcolor{SchoolColor}{Small RNA Dynamics\\ in Cholinergic Systems} \normalsize \\
		\vspace{100pt}
		\textsc{Dissertation\\ zur Erlangung des Doktorgrades\\ der Naturwissenschaften\\
		\vspace{12pt}
		Vorgelegt beim Fachbereich 14\\ der Johann Wolfgang von Goethe-Universität\\ in Frankfurt am Main\\
		\vspace{12pt}
		von\\
		\theauthor\\ aus Schlüchtern\\
		\vspace{12pt}
		Frankfurt \@degreeyear\\
		(D30)}
	\end{center} 
	\vspace*{\fill}
}

\newcommand{\formalpage}{
    %\pagenumbering{roman}
    %\setcounter{page}{2}
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
		Vom Fachbereich 14 der Johann Wolfgang Goethe-Universität als Dissertation angenommen.\\
		\vspace{100pt}
		\textbf{Dekan:} \\
		\vspace{5pt}
		Prof. Dr. Clemens Glaubitz\\
		\vspace{20pt}	
		
		\textbf{Gutachter:} \\
		\vspace{5pt}
		Prof. Dr. Jochen Klein\\
		Prof. Dr. Hermona Soreq\\
		\vspace{20pt}
		
		\textbf{Datum der Disputation:} \\
		\vspace{15pt}
		\rule{.2\textwidth}{0.4pt}
	\end{center}
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\copyrightpage}{
    %\pagenumbering{roman}
    %\setcounter{page}{3}
	\newpage
	\thispagestyle{empty}
	\begin{center}
		\vspace*{\fill}
		\scshape \noindent \small \copyright \small \@degreeyear\hspace{3pt}-- \theauthor \\
		\vspace{2pt}
		all rights reserved.
		\vspace*{\fill}
	\end{center}
	\newpage
	\rm
}

\newcommand{\abstractpage}{
    \pdfbookmark{Abstract}{Abstract}
	\newpage
	%\pagenumbering{roman}
	%\setcounter{page}{4}
	\pagestyle{fancy}
	\lhead{Thesis advisor: Professor \@advisor} \rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
    	\Large \textcolor{SchoolColor}{\@title} \normalsize \\
    	\vspace*{20pt}
    	\scshape Abstract \\ \rm
	\end{center}
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/abstract}
    \end{spacing}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\contentspage}{
    \pdfbookmark{\contentsname}{Contents}
	\renewcommand{\chapterheadstartvskip}{\vspace*{0pt}}
    \tableofcontents
}

\newcommand{\dedicationpage}{
    \cleardoublepage
    \phantomsection
    \pdfbookmark{Dedication}{Dedication}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
    \newpage
}

\newcommand{\acknowledgments}{
	%\setlength{\headheight}{100pt}
	\renewcommand{\chapterheadstartvskip}{\vspace*{100pt}}
	\chapter*{Acknowledgments}
	\noindent
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/thanks}
    \end{spacing}
	\vspace*{\fill} \newpage
}

\newcommand{\preamble}{
	%\setlength{\headheight}{100pt}
	\renewcommand{\chapterheadstartvskip}{\vspace*{0pt}}
	\chapter*{Preamble}
	\noindent
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/preamble}
    \end{spacing}
	\vspace*{\fill} \newpage
}

\newcommand{\abbreviations}{
	%\setlength{\headheight}{100pt}
	\renewcommand{\chapterheadstartvskip}{\vspace*{-50pt}} 
	\chapter*{Abbreviations}
	\noindent
    \begin{spacing}{\dcompressedspacing}
    	\footnotesize
	\printacronyms[include-classes = abb, heading = none]
	\printacronyms[include-classes = gene, name = Gene Symbols]
    \end{spacing}
	\vspace*{\fill} \newpage
}


% abbreviations

%\renewcommand{\backmatter}{
%    \begin{appendices}
%        \include{chapters/appendixA}
%    \end{appendices}
%    \input{endmatter/personalize}
%    \clearpage
%    \begin{spacing}{\dcompressedspacing}
%        \bibliography{references}
%        \addcontentsline{toc}{chapter}{References}
%        \bibliographystyle{apalike2}
%        \include{endmatter/colophon}
%    \end{spacing}
%}
