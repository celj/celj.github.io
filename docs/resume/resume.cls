% Intro Options
\ProvidesClass{resume}[2021/11/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[lmargin=0.9cm, vmargin=0.85cm, rmargin=0.9cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{enumitem}
\usepackage{graphicx}
\usepackage{pifont}
\usepackage[document]{ragged2e}
\usepackage{fontspec}
\usepackage{fontawesome}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Colors
\usepackage[usenames,dvipsnames]{xcolor}
\definecolor{date}{HTML}{172a45}
\definecolor{title}{HTML}{1f77e2}
\definecolor{primary}{HTML}{172a45}
\definecolor{headings}{HTML}{606a86}
\definecolor{subheadings}{HTML}{172a45}

% Fonts
\def \pathtitlefont {fonts/sourceserifpro/} 
\def \firstnamefont {SourceSerifPro-SemiBold}
\def \secondnamefont {SourceSerifPro-light}
\def \titlefont {\firstnamefont}
\def \namefontsize {9.5}
\def \pathmainfont {fonts/sourcesanspro/}
\def \mainfont {SourceSansPro-Regular}
\def \mainfontbold {SourceSansPro-SemiBold}
\def \mainfontsize {9.5}
\def \mainsansfont {SourceSansPro-Light}
\def \pathsubheadingfont {\pathmainfont}
\def \subheadingfont {\mainfontbold}
\def \subheadingsize {10}
\def \pathdescriptorfont {\pathsubheadingfont}
\def \descriptorfont {\secondnamefont}
\def \descriptorsize {10}
\def \pathlocationfont {fonts/officecodeprod/}
\def \locationfont {OfficeCodeProD-Regular}
\def \locationsize {8pt}
\def \pathmonofont {fonts/officecodeprod/}
\def \monofont {OfficeCodeProD-Light}

% Set main fonts
\usepackage{fontspec}
\setmainfont[Color=primary, Path = \pathmainfont,BoldFont=\mainfontbold,UprightFeatures={SizeFeatures={Size=\mainfontsize}},
  BoldFeatures={SizeFeatures={Size=\mainfontsize}}]{\mainfont}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = \pathmainfont,UprightFeatures={SizeFeatures={Size=\mainfontsize}}
  ]{\mainsansfont}

% Date command
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
\color{date}\fontspec[Path = \pathmainfont]{\mainfont}\fontsize{8pt}{10pt}\selectfont 
Last Updated on \today
\end{textblock}}

% Name command
\newcommand{\namesection}[4]{
\RaggedRight{
\color{title}
\fontsize{50pt}{60pt}
\fontspec[Path = \pathtitlefont]{\firstnamefont}\selectfont #1 
\fontspec[Path = \pathtitlefont]{\firstnamefont}\selectfont #2
} \\[5pt]

\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
\vspace{-15pt}

\RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{14pt}{14pt}\selectfont #3}

\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
\vspace{-15pt}

\RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{10pt}{14pt}\selectfont #4}

\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
\vspace{-15pt}
}

% Section separators
\usepackage{titlesec}
\titlespacing{\section}{0pt}{5pt}{5pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{5pt}}

% Headings command
\titleformat{\section}{\color{title}
\fontspec[Path = \pathtitlefont]{\titlefont}\fontsize{16pt}{24pt}\selectfont \raggedright}{}{0em}{}

% Subheadings command
\titleformat{\subsection}{
\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{12pt}\selectfont\bfseries}{}{0em}{}

%Subheadings on the right
\newcommand{\runsubsection}[1]{
\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{12pt}\selectfont\bfseries {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{headings}\raggedright\fontspec[Path = \pathsubheadingfont]{\subheadingfont}\fontsize{\subheadingsize}{12pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{date}\raggedright\fontspec[Path = \pathlocationfont]{\locationfont}\fontsize{\locationsize}{12pt}\selectfont {#1 \\} \normalfont}

%Contact Line
\newcommand{\contactline}[5]{\begingroup
\setbox0=\hbox{
\faCode \hspace{1pt} {#1}\hspace{0.3cm}
\faGithub \hspace{1pt} {#2}\hspace{0.3cm}
% \faGithub \hspace{1pt} {#3}\hspace{0.3cm}
\faEnvelopeO \hspace{1pt} {#4}\hspace{0.3cm}
\faPhone \hspace{1pt} {#5}
}\parbox{\wd0}{\box0}\endgroup}

%Inline Centered Logo
\newcommand{\vcenteredinclude}[2]{\begingroup
\setbox0=\hbox{\includegraphics[scale=0.10,trim={0 0.7cm 0cm 0cm}]{#1} {#2}}
\parbox{\wd0}{\box0}\endgroup}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}[label=\textbullet]\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}
