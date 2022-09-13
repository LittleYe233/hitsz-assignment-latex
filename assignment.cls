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
\titleformat*{\subsection}{\normalsize\bfseries}
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

% Define solving-problem block
\newcommand{\solveprob}[3]{
    \vspace{-0.4cm}\section*{#1}\vspace{-0.3cm} % Avoid auto numbering
    {#2}
    \vspace{-0.4cm}\subsection*{解}\vspace{-0.2cm}
    {#3}
}

% Define proving-problem block
\newcommand{\proveprob}[2]{
    \vspace{-0.4cm}\section*{#1}\vspace{-0.45cm} % Avoid auto numbering
    \subsection*{证明}\vspace{-0.2cm}
    {#2}
}
