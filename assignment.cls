\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{assignment}
              [LaTeX template example for assignments]

% Define options
\newif\if@asm@anonymous\@asm@anonymousfalse

\DeclareOption{anonymous}{\@asm@anonymoustrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper, 12pt]{article}

% Require packages and set up
% CTeX
\RequirePackage[scheme = chinese, heading = false, linespread = 1.5, zihao = -4, fontset = none]{ctex}
\ctexset{
    tablename = Table,
    figurename = Figure,
    autoindent = false
}
\setlength{\parindent}{0pt}
\setCJKfamilyfont{zhsong}{Noto Serif CJK SC}
%% Geometry\setlength{\footheight}{10pt}
%% IT MUST BE PLACED ABOVE FANCYHDR SETTINGS!
\RequirePackage{geometry}
\geometry{
    a4paper,
    portrait,
    top = 1.8cm,
    left = 1.8cm,
    right = 1.8cm,
    bottom = 2.3cm
}
%% FancyHdr
\RequirePackage{fancyhdr}
\fancyhf{}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
%% Title
\RequirePackage{titling}
\RequirePackage{titlesec}
\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}
\titlespacing*{\section}{0pt}{0ex}{0ex}
\titlespacing*{\subsection}{0pt}{0ex}{0ex}
\titlespacing*{\subsubsection}{0pt}{0ex}{0ex}
%% Setspace
\RequirePackage{setspace}
%% Wrap Figure
\RequirePackage{wrapfig}
%% Graphicx specifies image path
\RequirePackage{graphicx}
\graphicspath{ {./, ./figures, ./figure, ./images, ./image} }
%% Math
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{fourier}
\RequirePackage{unicode-math}
%% Font
\RequirePackage{fontspec}
\setmainfont{Noto Serif CJK SC}
%% Multi-column
\usepackage{multicol}
\setlength{\columnsep}{1cm}

% Document variables
\newcommand\homework[1]{%
    \newcommand{\asm@tokens@homework}{#1}}
\newcommand*\stuno[1]{%
    \newcommand{\asm@tokens@stuno}{#1}}
\newcommand*\stumajor[1]{%
    \newcommand{\asm@tokens@stumajor}{#1}}
\newcommand*\portrait[1]{%
    \newcommand{\asm@tokens@portrait}{#1}}

% Define title block
\renewcommand{\maketitle}{
    \if@asm@anonymous
    \else
        % Identity block start
        \begin{normalsize}
            \begin{spacing}{2.5}
                \begin{wrapfigure}{r}{0pt}
                    \centering\includegraphics[height=85pt]{\asm@tokens@portrait}
                \end{wrapfigure}

                \textbf{作者:\ }\theauthor      \\
                \textbf{学号:\ }\asm@tokens@stuno       \\
                \textbf{专业:\ }\asm@tokens@stumajor
            \end{spacing}
            \vspace{-0.3cm}
        \end{normalsize}
        % Identity block end
    \fi
    
    % Set title
    \title{\asm@tokens@homework}

    % Print title
    \begin{center}
        \parbox{14cm}{\centering\textbf{\Large\thetitle}}
    \end{center}
    \vspace{-0.6cm}
}

% Define "解" and "证明"
% \newcommand{\solve*}{\textbf{解}}
% \newcommand{\prove*}{\textbf{证明}}
\newcommand{\solve}{\par\textbf{解}\par}
\newcommand{\prove}{\par\textbf{证明}\par}

% Define problem-set
\newcommand{\probset}{\section*}

% Define section-only problem block
\newcommand{\prob}[1]{
    \subsection*{#1}
}

% Define solving-problem block
\newcommand{\solveprob}[3]{
    \subsection*{#1} % Avoid auto numbering
    {#2}\par
    \solve
    {#3}
}

% Define proving-problem block
\newcommand{\proveprob}[2]{
    \subsection*{#1}\par % Avoid auto numbering
    \prove
    {#2}
}

% Define sub-problem command
\newcommand{\subprob}[1]{\subsubsection*{#1}}

% Define `\arc' command
% See: https://tex.stackexchange.com/a/284787
\DeclareFontFamily{U}{tipa}{}
\DeclareFontShape{U}{tipa}{m}{n}{<->tipa10}{}
\newcommand{\arc@char}{{\usefont{U}{tipa}{m}{n}\symbol{62}}}%

\newcommand{\arc}[1]{\mathpalette\arc@arc{#1}}

\newcommand{\arc@arc}[2]{%
  \sbox0{$\m@th#1#2$}%
  \vbox{
    \hbox{\resizebox{\wd0}{\height}{\arc@char}}
    \nointerlineskip
    \box0
  }%
}

% Define new equation Environment
% See: https://tex.stackexchange.com/a/287246
\newenvironment{eq*}{
    \vspace{-1em}
    \begin{equation*}
}{
    \end{equation*}
}

\newenvironment{eq}{
    \vspace{-1em}
    \begin{equation}
}{
    \end{equation}
}
