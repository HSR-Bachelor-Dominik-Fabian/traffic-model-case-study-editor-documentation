\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hsrthesis}[2012/06/06 A LaTex template for HSR Thesis]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass[a4paper]{report}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\newcommand{\nothing}{}


% Including mostly used packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\usepackage{mathptmx}
\usepackage[scaled=0.85]{helvet}
\usepackage{hyperref}
\usepackage{array}
\usepackage{german}
\usepackage{color}
\usepackage{listings} \lstset{backgroundcolor=\color{lightgrey}} \lstset{language=Java}
\usepackage{wrapfig}
\usepackage{url}
\usepackage{float}
\usepackage{natbib}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{glossaries}
\usepackage{mfirstuc}
\usepackage{setspace}
\definecolor{lightgrey}{rgb}{.9,.9,.9}
\usepackage[paper=a4paper,textwidth=13.5cm,right=3cm,top=2.5cm,hoffset=-0.25in]{geometry}
\onehalfspacing

% Table Stylings
% http://tex.stackexchange.com/a/13748
%%%%%%%%%%%%%%%%%%%%

\newcommand*\heading[1]{\bfseries{#1}}
\newcommand*\beforeheading{\toprule}
\newcommand*\afterheading{\midrule}
\newcommand*\normalline{}
\newcommand*\lastline{\bottomrule}


\definecolor{gray}{rgb}{0.4,0.4,0.4}
\definecolor{darkblue}{rgb}{0.0,0.0,0.6}
\definecolor{cyan}{rgb}{0.0,0.6,0.6}

\lstdefinelanguage{XML}
{
  morestring=[b]",
  morestring=[s]{>}{<},
  morecomment=[s]{<?}{?>},
  stringstyle=\color{black},
  identifierstyle=\color{darkblue},
  keywordstyle=\color{cyan},
  morekeywords={xmlns,version,type}% list your attributes here
}


% Titlepage
%%%%%%%%%%%

\if@titlepage
	\renewcommand{\maketitle}{
		\begin{titlepage}
		% Logos
		\begin{picture}(0,200)(0,-100)
      		\put(-60, -30){\includegraphics[height=30mm]{images/hsrlogo.png}}
      		\put(200, -15){\includegraphics[height=14mm]{images/partnerlogo.png}}
		\end{picture}

		% title
		\begin{center}
			\Large\thesistype , \departement\\[2ex]
			\huge\thesistitle\\[2ex]
			\large\school\\[1ex]
			\normalsize\term\\
			\normalsize\thedate
			\vfill
		\end{center}

		\begin{minipage}{\textwidth}
			\begin{flushleft}
				\large
				\begin{tabular}[t]{ll}
				% Checking Autor(s)
				\ifthenelse{\equal{\thesisauthora}{}}{\message{blub}}{\ifthenelse{\equal{\thesisauthorb}{}}{\emph{Autor:} & \thesisauthora\\[3pt]}{\ifthenelse{\equal{\thesisauthorc}{}}{\emph{Autoren:} & \thesisauthora \ \& \thesisauthorb\\[3pt]}{\emph{Autoren:} & \thesisauthora \ \& \thesisauthorb \ \& \thesisauthorc\\[3pt]}}}
				% Checking Supporter
				\ifthenelse{\equal{\professor}{}}{\\}{\emph{Betreuer:} & \professor\\[3pt]}
					\emph{Projektpartner:} & \partner\\[3pt]
					\emph{Arbeitsperiode:} & \timeperiode\\[3pt]
					\emph{Arbeitsumfang:} & \workload\\[3pt]
				\end{tabular}
			\end{flushleft}
		\end{minipage}
\end{titlepage}%    
}
   \else
   \renewcommand{\maketitle}{%
     \begin{flushleft}
       \null\hfill
       \vskip 2cm
       \sffamily\bfseries\upshape\huge
       \@title\\
       \mdseries\upshape\large
       \vspace{.5em}%
       \@author, \@date\\
	% \rule{\textwidth}{.5mm}\\
     \end{flushleft}
     \@thanks
     \par
     \vskip 1cm
     }
   \fi