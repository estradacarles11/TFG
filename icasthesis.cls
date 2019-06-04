% icasthesis.cls
%     ICAS Thesis LaTeX class based on standard book class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Revisions
%    v 0.0  22/01/2013  First release
%      0.1  29/01/2013  B5 paper and cover rearrangement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Minimal source template:
%
% \documentclass[frame|cam]{icasthesis}
% \title{text} 
% \author{text}
% \degree{text}
% \department{text}
% \university{text}
% \universitylogo{filename}
% \tutor{text}
% \tutorposition{text}
% \supervisor{text}
% \supervisorposition{text}
% \supervisortwo{text}
% \supervisortwoposition{text}
% \institute{text}
% \institutelogo{filename}
% \date{month year}
% \dedication{text}
% \abstractbilingual{cat-text}{eng-text}
% \acknowledgments{text}
% \acronymsfile{filename}
% \setPDFmetadata
%
% \begin{document}
% \makefront
% \chapter[short-name]{long-name}
% \appendix
% \chapter[short-name]{long-name}
% \bibliography{bib-file}
% \end{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icasthesis}[2013/01/29 ICAS Thesis]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{cam}{\PassOptionsToPackage{\CurrentOption}{crop}}
\DeclareOption{frame}{\PassOptionsToPackage{\CurrentOption}{crop}}
\ProcessOptions\relax

% Base class
\LoadClass[b5paper,10pt,twoside,openright,onecolumn,titlepage]{book}

% Package dependencies and basic settings
\RequirePackage[utf8]{inputenc} % UTF-8 source text encoding
\RequirePackage[catalan]{babel} % Frontmatter in Catalan and mainmatter in English	\RequirePackage[english,catalan]{babel}
\RequirePackage{lmodern} % Latin Computer Modern fonts
\RequirePackage[T1]{fontenc} % Postscript Type-1 font encoding
\RequirePackage[headheight=15.5pt]{geometry} % page layout
\RequirePackage[a4,center]{crop} % cropping marks
\RequirePackage{fancyhdr} % headers and footers
\RequirePackage{sectsty} % title format
\RequirePackage{setspace} % line spacing
\RequirePackage{graphicx} % graphics stuff
\DeclareGraphicsExtensions{.pdf}
\RequirePackage{color} % coloring
\RequirePackage{hyperref} % all PDF specials
\RequirePackage[printonlyused]{acronym} % list of acronyms
\RequirePackage{caption} % float captions hanged and with bold labels
\RequirePackage{amscd} % math stuff
\RequirePackage{amsmath} % math stuff
\RequirePackage{amstext} % math stuff
\RequirePackage{amssymb} % math stuff
\RequirePackage{amsfonts} % math stuff
\RequirePackage{array} % % math tables
\RequirePackage[numbers,compress]{natbib} % bibliography stuff

% Configurable fields
\def\@degree{Degree name}
\newcommand{\degree}[1]{\def\@degree{#1}}
\def\@department{Department name}
\newcommand{\department}[1]{\def\@department{#1}}
\def\@university{University name}
\newcommand{\university}[1]{\def\@university{#1}}
\def\@universitylogo{\includegraphics[width=0.2\textwidth]{logo-file}}
\newcommand{\universitylogo}[1]{\def\@universitylogo{#1}}
\def\@tutor{Tutor name}
\newcommand{\tutor}[1]{\def\@tutor{#1}}
\def\@tutorposition{Tutor position}
\newcommand{\tutorposition}[1]{\def\@tutorposition{#1}}
\def\@supervisor{Supervisor name}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\def\@supervisorposition{Supervisor position}
\newcommand{\supervisorposition}[1]{\def\@supervisorposition{#1}}
\def\@supervisortwo{Second supervisor name}
\newcommand{\supervisortwo}[1]{\def\@supervisortwo{#1}}
\def\@supervisortwoposition{Second supervisor position}
\newcommand{\supervisortwoposition}[1]{\def\@supervisortwoposition{#1}}
\def\@institute{Institute name}
\newcommand{\institute}[1]{\def\@institute{#1}}
\def\@institutelogo{\includegraphics[width=0.2\textwidth]{logo-file}}
\newcommand{\institutelogo}[1]{\def\@institutelogo{#1}}
\def\@dedication{Dedication text}
\newcommand{\dedication}[1]{\def\@dedication{#1}}
\def\@abstractcat{Catalan abstract}
\def\@abstracteng{English abstract}
\newcommand{\abstractbilingual}[2]{\def\@abstractcat{#1}\def\@abstracteng{#2}}
\def\@acknowledgments{Acknowledgements text}
\newcommand{\acknowledgments}[1]{\def\@acknowledgments{#1}}
\def\@acronymsfile{acro-eng.tex}
\newcommand{\acronymsfile}[1]{\def\@acronymsfile{#1}}

% PDF metadata
\newcommand{\setPDFmetadata}{%
\hypersetup{
 pdftitle={\@title},
 pdfauthor={\@author},
 pdfpagemode=UseOutlines,
 pdfstartview=FitH,
 %colorlinks=false,linkcolor=green,anchorcolor=green,
 %citecolor=green,filecolor=green,menucolor=green,
 %pagecolor=green,urlcolor=green
}}

% Page layout
\geometry{
 includeheadfoot,
 top=25mm,bottom=25mm,
 left=25mm,right=25mm,
 headsep=10mm,footskip=10mm
}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1.5ex}

% Chapter titles
\renewcommand{\@makechapterhead}[1]{
 \vspace*{0.1\textheight}
 {\flushright
  \bfseries\Huge
  \hfill%
  \begin{tabular}[b]{r@{\hskip 5mm}!{\vrule width 0.5mm}@{\hskip 3mm}l}
   \parbox[b]{0.85\textwidth}{\flushright #1} & \thechapter\\
  \end{tabular}\\
 }
 \vspace*{0.1\textheight}
}
\renewcommand{\@makeschapterhead}[1]{
 \vspace*{0.2\textheight}
 {\flushright
  \bfseries\Huge
  \hfill%
  \begin{tabular}[b]{r@{\hskip 5mm}!{\vrule width 0.5mm}@{\hskip 3mm}l}
   \parbox[b]{0.85\textwidth}{\flushright #1} & \vphantom{\thechapter}\\
  \end{tabular}\\
 }
 \vspace*{0.1\textheight}
}

% Float captions
\DeclareCaptionFormat{mycaption}{
\begin{tabular}{r!{\vrule width 0.25mm}l}
#1 & \parbox[t]{0.65\textwidth}{#3}\\
\end{tabular}
}
\captionsetup{
 format=mycaption,
 font=small,
 labelfont=bf,
 margin={10mm,10mm},
 singlelinecheck=false
}

% Frontmatter
\newcommand{\makefront}{%
 \frontmatter
 \pagestyle{empty}

 \selectlanguage{catalan}
 \begin{titlepage}
  \begin{center}
   \Large
   \@universitylogo\\
   \vspace*{0.5ex}
   \@department\\
   \vspace*{0.15\textheight}
   \doublespacing
   {\Huge \scshape \@title}\\
   \vspace*{2ex}
   {\LARGE \@author}\\
   \vspace*{\fill}
   \singlespacing
   Memòria de Treball de Fi de Grau\\
   presentada per optar al títol de\\
   \vspace*{1ex}
   \onehalfspacing
   {\LARGE \scshape \@degree}\\
   \vspace*{2ex}
   \@date\\
  \end{center}
 \end{titlepage}
 \cleardoublepage

 \begin{center}
  \@universitylogo \hspace{\fill} \@institutelogo\\
 \end{center}
 \vspace*{\fill}
 \ifx\@supervisortwo\empty
  \ifx\@tutor\empty
   \@supervisor, \@supervisorposition,\\
  \else
   \@supervisor, \@supervisorposition, i \@tutor, \@tutorposition,\\
  \fi
 \else
  \ifx\@tutor\empty
    \@supervisor, \@supervisorposition, i \@supervisortwo, \@supervisortwoposition,\\
  \else
   \@supervisor, \@supervisorposition, \@supervisortwo, \@supervisortwoposition, i \@tutor, \@tutorposition,\\
  \fi
 \fi
 \begin{flushright}
  \bfseries\Huge
  \begin{tabular}[b]{r@{\hskip 5mm}!{\vrule width 0.5mm}@{\hskip 3mm}l}
   \ifx\@supervisortwo\empty
    \ifx\@tutor\empty
     \parbox[b]{0.85\textwidth}{\flushright Certifica} & \\
    \else
     \parbox[b]{0.85\textwidth}{\flushright Certifiquen} & \\
    \fi
   \else
    \parbox[b]{0.85\textwidth}{\flushright Certifiquen} & \\
   \fi 
  \end{tabular}\\
 \end{flushright}
 \vspace*{\fill}
 que la Memòria de Treball de Fi de Grau \emph{\@title} presentada per \@author\ per optar al títol de \@degree\ s'ha realitzat sota la seva direcció a \@institute\ i ha estat tutoritzada en el \@department\ de la \@university.
 \vspace*{\fill}
 \begin{flushright}
  \begin{tabular}{>{\hfill}p{20mm}!{~\vrule width 0.5mm~}ll}
   \ifx\@supervisortwo\empty
    Director & \@supervisor & \parbox[b]{50mm}{\dotfill}\\
   \else
    Directors & \@supervisor & \parbox[b]{50mm}{\dotfill}\\
     & & \\
              & \@supervisortwo & \parbox[b]{50mm}{\dotfill}\\
   \fi
  \ifx\@tutor\empty
  \else
   & & \\
   Tutor    & \@tutor & \parbox[b]{50mm}{\dotfill}\\
  \fi
  \end{tabular}\\
 \end{flushright}
 \vspace*{\fill}
 \begin{flushright}
  \parbox[b]{40mm}{\dotfill}, a \parbox[b]{10mm}{\dotfill} de \parbox[b]{25mm}{\dotfill} de \parbox[b]{15mm}{\dotfill}\\
 \end{flushright}
 \vspace*{\fill}
 \cleardoublepage

 %\pagestyle{plain}
 %
 %\vspace*{\fill}
 %\begin{flushright}
 % \large\itshape
 % \@dedication\\
 %\end{flushright}
 %\vspace*{\fill}
 %\cleardoublepage
 
 \vspace*{\fill}
 {\flushright
  \bfseries\Huge
  \hfill%
  \begin{tabular}[b]{r@{\hskip 5mm}!{\vrule width 0.5mm}@{\hskip 3mm}l}
   \parbox[b]{0.85\textwidth}{\flushright Resum} & \\
  \end{tabular}\\
 }
 \vspace*{5ex}
 \@abstractcat
 \vspace*{\fill}
 \selectlanguage{catalan}
 {\flushright
  \bfseries\Huge
  \hfill%
  \begin{tabular}[b]{r@{\hskip 5mm}!{\vrule width 0.5mm}@{\hskip 3mm}l}
   \parbox[b]{0.85\textwidth}{\flushright Abstract} & \\
  \end{tabular}\\}
 \vspace*{5ex}
 \@abstracteng
 \vspace*{\fill}
 \cleardoublepage

 \chapter*{Agraïments}
 \@acknowledgments
 \cleardoublepage
 
 \tableofcontents
 \cleardoublepage
 
 \listoffigures
 \cleardoublepage
 
 %\listoftables
 %\cleardoublepage
 
 \chapter*{Índex d'acrònims}
 \input{\@acronymsfile}
 \cleardoublepage
 
 \mainmatter
 
 \pagestyle{fancy}
 \fancyhead{}
 \fancyhead[LE,RO]{\thepage}
 \fancyhead[LO]{\rightmark}
 \fancyhead[RE]{\leftmark}
 \cfoot{}
 \renewcommand{\headrulewidth}{0.25mm}
 \allsectionsfont{\sffamily}
}

% Bibliography
\bibliographystyle{icasthesis}

\renewcommand\bibsection{\chapter*{\refname}}

\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
