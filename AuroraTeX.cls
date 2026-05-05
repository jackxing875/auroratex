% ===========================================================================
%  AuroraTeX.cls — Clean modern report template
% ===========================================================================
%  This document class extends the standard `report` class with a polished
%  visual identity, sensible typography defaults, and ready-to-use
%  environments for notes, code, plots, theorems, and more.
%
%  Compiler recommendation: XeLaTeX (supports custom fonts and CJK scripts).
%  pdfLaTeX also works for English-only documents (sans-serif fallback used).
% ===========================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AuroraTeX}[2026/05/05 v1.0 Clean modern report template]

% ---------------------------------------------------------------------------
%  Class options
% ---------------------------------------------------------------------------
%  chinese  → Loads ctex for Chinese typesetting (requires XeLaTeX/LuaLaTeX)
%  All other options are forwarded to the underlying `report` class.
% ---------------------------------------------------------------------------
\newif\ifAurora@chinese
\DeclareOption{chinese}{\Aurora@chinesetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% Base class: 11pt, A4 paper, one-sided (common for report handouts / binding)
\LoadClass[11pt,a4paper,oneside]{report}

% ---------------------------------------------------------------------------
%  Font configuration — sans-serif as the default family
% ---------------------------------------------------------------------------
%  The template uses a clean sans-serif look throughout.
%  - XeLaTeX / LuaLaTeX:  fontspec + TeX Gyre Heros (Helvetica-like),
%    falling back to Latin Modern Sans if Heros is unavailable.
%  - pdfLaTeX:             helvet package; redefines \familydefault to sf.
%  - Monospace:            TeX Gyre Cursor (Courier-like) or DejaVu Sans Mono.
%
%  To change fonts, edit the \setmainfont / \setsansfont / \setmonofont
%  calls below.  Any OpenType font installed on your system can be used
%  with fontspec.  For pdfLaTeX, swap in a different LaTeX font package.
% ---------------------------------------------------------------------------
\RequirePackage{iftex}
\ifAurora@chinese
  \RequirePackage[UTF8,heading=false]{ctex}
\fi

\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{helvet}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \RequirePackage{fontspec}
  \IfFontExistsTF{TeX Gyre Heros}
    {\setmainfont{TeX Gyre Heros}\setsansfont{TeX Gyre Heros}}
    {\setmainfont{Latin Modern Sans}\setsansfont{Latin Modern Sans}}
  \IfFontExistsTF{TeX Gyre Cursor}
    {\setmonofont{TeX Gyre Cursor}}
    {\setmonofont{DejaVu Sans Mono}}
\fi

% ---------------------------------------------------------------------------
%  Page geometry
% ---------------------------------------------------------------------------
%  Left margin is slightly wider (3 cm) to leave room for binding or
%  handwritten annotations.  Adjust the values below to suit your needs.
% ---------------------------------------------------------------------------
\RequirePackage[
  top=2.5cm,
  right=2.0cm,
  bottom=2.5cm,
  left=3.0cm
]{geometry}

% ---------------------------------------------------------------------------
%  Core packages — loaded unconditionally
% ---------------------------------------------------------------------------
\RequirePackage{xcolor}          % colour support (theme palette defined below)
\RequirePackage{graphicx}        % \includegraphics and graphics manipulation
\RequirePackage{microtype}       % subtle typographic improvements (protrusion etc.)
\RequirePackage{setspace}        % \setstretch, \onehalfspacing, etc.
\RequirePackage{ragged2e}        % improved ragged alignment with hyphenation
\RequirePackage{amsmath,amssymb,mathtools,amsthm}  % maths & theorem tools
\RequirePackage{booktabs,array,tabularx,multirow}  % professional-quality tables
\RequirePackage{enumitem}        % customisable list environments
\RequirePackage{float}           % [H] placement specifier for figures/tables
\RequirePackage{caption}         % figure / table caption formatting
\RequirePackage{subcaption}      % sub-figures and sub-tables
\RequirePackage{fancyhdr}        % custom headers and footers
\RequirePackage{titlesec}        % chapter / section / subsection formatting
\RequirePackage{tocloft}         % table-of-contents layout
\RequirePackage{etoc}            % local (mini) tables of contents per chapter
\RequirePackage[skins,breakable,listings]{tcolorbox} % coloured boxes (notes, warnings, etc.)
\RequirePackage{listings}        % code listings
\RequirePackage{tikz}            % programmatic graphics
\RequirePackage{pgfplots}        % data plots via TikZ/PGF
\RequirePackage{natbib}          % author-year citations
\RequirePackage{xurl}            % line-breakable URLs
\RequirePackage{hyperref}        % hyperlinks and PDF metadata
\RequirePackage{bookmark}        % improved PDF bookmarks

% ---------------------------------------------------------------------------
%  Colour palette
% ---------------------------------------------------------------------------
%  The entire template can be re-themed by editing these definitions.
%  Each semantic colour name maps to a role: Blue for headings/links,
%  Wine for warnings, Green for examples, Orange for highlights,
%  and Red for code strings.  Background tints are lighter variants.
%
%  Tip: use a colour-picker to find harmonious HTML hex values,
%  then paste them here and recompile.
% ---------------------------------------------------------------------------
\definecolor{AuroraBlue}{HTML}{005F87}
\definecolor{AuroraWine}{HTML}{8A0D36}
\definecolor{AuroraOrange}{HTML}{C76529}
\definecolor{AuroraGreen}{HTML}{20823B}
\definecolor{AuroraRed}{HTML}{B43B48}
\definecolor{AuroraInk}{HTML}{111111}
\definecolor{AuroraMuted}{HTML}{6B7280}
\definecolor{AuroraGrid}{HTML}{D9DEE6}
\definecolor{AuroraCodeBg}{HTML}{F1F1F1}
\definecolor{AuroraNoteBg}{HTML}{E8F1F7}
\definecolor{AuroraWarnBg}{HTML}{F3DADC}
\definecolor{AuroraExampleBg}{HTML}{EAF4EA}
\definecolor{AuroraHighlightBg}{HTML}{FBF3DF}

% ---------------------------------------------------------------------------
%  PDF hyperlinks
% ---------------------------------------------------------------------------
%  Internal links (cross-references, citations, URLs) are coloured in
%  AuroraBlue with no visible border.  Change linkcolor / citecolor /
%  urlcolor here to use a different colour, or set colorlinks=false to
%  revert to the classic red/green citation boxes.
% ---------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=AuroraBlue,
  citecolor=AuroraBlue,
  urlcolor=AuroraBlue,
  pdfborder={0 0 0}
}

% ---------------------------------------------------------------------------
%  Paragraph formatting
% ---------------------------------------------------------------------------
%  Zero paragraph indentation; moderate inter-paragraph skip; 1.1×
%  line-spacing for readability; ragged-justified alignment.
% ---------------------------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.65em plus 0.15em minus 0.05em}
\setstretch{1.1}
\justifying
\sloppy

% ---------------------------------------------------------------------------
%  List environments (itemize, enumerate, description)
% ---------------------------------------------------------------------------
%  Compact spacing and a clean description-list layout.  Tweak the
%  topsep / itemsep values to go denser or airier as desired.
% ---------------------------------------------------------------------------
\setlist{
  topsep=0.35em,
  itemsep=0.15em,
  parsep=0pt,
  leftmargin=*
}
\setlist[description]{
  style=multiline,
  font=\bfseries,
  leftmargin=2.35cm,
  labelwidth=1.8cm,
  labelsep=0.35cm
}

% ---------------------------------------------------------------------------
%  Figure / table captions
% ---------------------------------------------------------------------------
%  Bold label, colon separator, centred, small font size.  The colon can
%  be changed to a period (labelsep=period) or dash if preferred.
% ---------------------------------------------------------------------------
\captionsetup{
  font=small,
  labelfont=bf,
  labelsep=colon,
  justification=centering,
  singlelinecheck=false
}

% ---------------------------------------------------------------------------
%  Headers and footers
% ---------------------------------------------------------------------------
%  Minimal design: only the page number centred in the footer.
%  No header or footer rule lines.
%  To add running chapter or section titles, uncomment and adjust the
%  \fancyhead[LE,RO]{...} lines.
% ---------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% ---------------------------------------------------------------------------
%  Chapter title style
% ---------------------------------------------------------------------------
%  Numbered chapters display a large "Chapter N" in AuroraWine on the
%  right, with the chapter name in AuroraBlue below.  The gap before the
%  chapter heading (3.2 cm) leaves generous whitespace at the top of the
%  page.  To replace "Chapter" with a different word (e.g. "Unit"), edit
%  the literal text "Chapter" inside the \makebox below.
%
%  Unnumbered chapters (e.g. \chapter*{...} or the bibliography) use a
%  simpler centred heading of the same size.
% ---------------------------------------------------------------------------
\titleformat{\chapter}[display]
  {\normalfont\bfseries}
  {\makebox[\textwidth][r]{%
    {\fontsize{44}{50}\selectfont Chapter}%
    \hspace{0.25em}%
    {\color{AuroraWine}\fontsize{90}{94}\selectfont\thechapter}%
  }}
  {1.2cm}
  {\raggedright\color{AuroraBlue}\fontsize{31}{37}\selectfont}
\titlespacing*{\chapter}{0pt}{3.2cm}{1.25cm}

\titleformat{name=\chapter,numberless}[display]
  {\normalfont\bfseries\fontsize{36}{42}\selectfont}
  {}
  {0pt}
  {\raggedright}
\titlespacing*{name=\chapter,numberless}{0pt}{2.0cm}{1.2cm}

% ---------------------------------------------------------------------------
%  Section / subsection / subsubsection styles
% ---------------------------------------------------------------------------
%  All three levels use bold AuroraBlue with a clean "N  Title" layout.
%  Adjust the font sizes or colour below if you prefer a different look.
% ---------------------------------------------------------------------------
\titleformat{\section}
  {\normalfont\bfseries\color{AuroraBlue}\fontsize{18}{22}\selectfont}
  {\thesection}
  {0.45em}
  {}
\titlespacing*{\section}{0pt}{1.4em}{0.55em}

\titleformat{\subsection}
  {\normalfont\bfseries\color{AuroraBlue}\fontsize{13.5}{17}\selectfont}
  {\thesubsection}
  {0.45em}
  {}
\titlespacing*{\subsection}{0pt}{1.2em}{0.35em}

\titleformat{\subsubsection}
  {\normalfont\bfseries\color{AuroraBlue}\fontsize{12}{15}\selectfont}
  {\thesubsubsection}
  {0.45em}
  {}
\titlespacing*{\subsubsection}{0pt}{1em}{0.25em}

% ---------------------------------------------------------------------------
%  Table of contents (global)
% ---------------------------------------------------------------------------
%  – Show chapters and sections (tocdepth = 2); number down to subsubsection
%    (secnumdepth = 3).
%  – Title font matches the unnumbered-chapter style (36 pt bold).
%  – Chapter entries are bold AuroraBlue; sections / subsections are
%    AuroraBlue with normal weight.
%  – Leader dots are spaced at 1.4× the default.
%
%  To include subsubsections in the ToC, increase tocdepth to 3.
%  To remove the coloured entries, comment the \cftchapfont / \cftsecfont
%  lines.
% ---------------------------------------------------------------------------
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}
\renewcommand{\contentsname}{Contents}
\renewcommand{\cfttoctitlefont}{\normalfont\bfseries\fontsize{36}{42}\selectfont}
\renewcommand{\cftaftertoctitle}{\par\vspace{1.2cm}}
\renewcommand{\cftchapfont}{\bfseries\color{AuroraBlue}}
\renewcommand{\cftchappagefont}{\bfseries}
\renewcommand{\cftsecfont}{\color{AuroraBlue}}
\renewcommand{\cftsubsecfont}{\color{AuroraBlue}}
\renewcommand{\cftdotsep}{1.4}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforechapskip}{1.05em}
\setlength{\cftbeforesecskip}{0.28em}
\setlength{\cftchapnumwidth}{2.2em}
\setlength{\cftsecnumwidth}{3.0em}
\setlength{\cftsubsecnumwidth}{4.0em}
\setlength{\cftchapindent}{0pt}
\setlength{\cftsecindent}{2.2em}
\setlength{\cftsubsecindent}{5.2em}

% ---------------------------------------------------------------------------
%  \Chapter — chapter with a mini table of contents
% ---------------------------------------------------------------------------
%  \AuroraChapter (aliased to \Chapter) behaves like \chapter, but
%  automatically inserts a local table of contents showing the subsections
%  of the current chapter.  This gives the reader an immediate overview.
%
%  To use the ordinary \chapter (without the mini-ToC), simply call
%  \chapter{...} instead.
% ---------------------------------------------------------------------------
\newcommand{\AuroraChapter}[1]{%
  \chapter{#1}%
  \begingroup
    \setlength{\parskip}{0pt}%
    \etocsetnexttocdepth{subsection}%
    \etocruledstyle[1]{\normalfont\large Contents}%
    \localtableofcontents
  \endgroup
  \vspace{1.0em}
}
\let\Chapter\AuroraChapter

% ---------------------------------------------------------------------------
%  Title-page metadata commands
% ---------------------------------------------------------------------------
%  These \newcommand / \gdef macros store extra metadata for the title
%  page.  All are optional — if left empty the corresponding line on the
%  title page is omitted.
%
%  Usage in main.tex:
%    \subtitle{Report and Documentation Template}
%    \email{your.name@example.edu}
%    \studentname{Your Name}
%    \studentnumber{20260000}
%    \modulename{Course or Project Name}
%    \institution{University of ...}
% ---------------------------------------------------------------------------
\makeatletter
\newcommand{\subtitle}[1]{\gdef\Aurora@subtitle{#1}}
\newcommand{\email}[1]{\gdef\Aurora@email{#1}}
\newcommand{\studentname}[1]{\gdef\Aurora@studentname{#1}}
\newcommand{\studentnumber}[1]{\gdef\Aurora@studentnumber{#1}}
\newcommand{\modulename}[1]{\gdef\Aurora@modulename{#1}}
\newcommand{\institution}[1]{\gdef\Aurora@institution{#1}}
\gdef\Aurora@subtitle{}
\gdef\Aurora@email{}
\gdef\Aurora@studentname{}
\gdef\Aurora@studentnumber{}
\gdef\Aurora@modulename{}
\gdef\Aurora@institution{}

% ---------------------------------------------------------------------------
%  Title page layout — \maketitle
% ---------------------------------------------------------------------------
%  The title page is produced by \maketitle.  It centres the title (and
%  optional subtitle) in the upper-middle portion of the page, places
%  author / email / date below, and adds an optional metadata table at
%  the bottom.  The page style is set to "empty" (no header/footer).
%
%  Page numbering starts at 2 after the title page; the title page itself
%  is not numbered.
% ---------------------------------------------------------------------------
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \vspace*{0.23\paperheight}
    \begin{center}
      {\bfseries\fontsize{25}{30}\selectfont \@title\par}
      \ifx\Aurora@subtitle\@empty\else
        \vspace{0.55em}
        {\bfseries\fontsize{27}{33}\selectfont \Aurora@subtitle\par}
      \fi
      \vspace{3.0em}
      {\fontsize{17}{22}\selectfont \@author\par}
      \ifx\Aurora@email\@empty\else
        \vspace{1.35em}
        {\fontsize{17}{22}\selectfont \Aurora@email\par}
      \fi
      \ifx\@date\@empty\else
        \vspace{1.35em}
        {\fontsize{13}{16}\selectfont \@date\par}
      \fi
      \vfill
      \begin{tabular}{@{}r@{\hspace{1.45em}}l@{}}
        \ifx\Aurora@studentname\@empty\else
          \textbf{Student Name} & \Aurora@studentname\\[0.45em]
        \fi
        \ifx\Aurora@studentnumber\@empty\else
          \textbf{Student Number} & \Aurora@studentnumber\\[0.45em]
        \fi
        \ifx\Aurora@modulename\@empty\else
          \textbf{Module Name} & \Aurora@modulename\\[0.45em]
        \fi
        \ifx\Aurora@institution\@empty\else
          \textbf{Institution} & \Aurora@institution
        \fi
      \end{tabular}
      \vspace*{0.12\paperheight}
    \end{center}
  \end{titlepage}
  \setcounter{page}{2}%
}
\makeatother

% ---------------------------------------------------------------------------
%  Information boxes (tcolorbox based)
% ---------------------------------------------------------------------------
%  Each environment is a flat, breakable box with a coloured left rule
%  and a pale background.  The "aurora box" style defines the shared
%  geometry; individual environments override the colours.
%
%  Available environments:
%    note / excerpt      — Blue left rule, light-blue background
%    warning             — Wine left rule, light-pink background
%    example / examplebox— Green left rule, light-green background
%    highlight / highlightbox — Orange left rule, light-yellow background
%
%  To change a box colour, edit the `colback` and `borderline west`
%  colour values below.
% ---------------------------------------------------------------------------
\tcbset{
  aurora box/.style={
    enhanced,
    breakable,
    sharp corners,
    boxrule=0pt,
    frame hidden,
    left=1.15em,
    right=1.0em,
    top=0.8em,
    bottom=0.8em,
    before skip=1em,
    after skip=1em
  }
}

\newtcolorbox{note}{
  aurora box,
  colback=AuroraNoteBg,
  borderline west={2pt}{0pt}{AuroraBlue}
}
\newtcolorbox{excerpt}{
  aurora box,
  colback=AuroraNoteBg,
  borderline west={2pt}{0pt}{AuroraBlue}
}
\newtcolorbox{warning}{
  aurora box,
  colback=AuroraWarnBg,
  borderline west={2pt}{0pt}{AuroraWine}
}
\newtcolorbox{examplebox}{
  aurora box,
  colback=AuroraExampleBg,
  borderline west={2pt}{0pt}{AuroraGreen}
}
\newtcolorbox{example}{
  aurora box,
  colback=AuroraExampleBg,
  borderline west={2pt}{0pt}{AuroraGreen}
}
\newtcolorbox{highlightbox}{
  aurora box,
  colback=AuroraHighlightBg,
  borderline west={2pt}{0pt}{AuroraOrange}
}
\newtcolorbox{highlight}{
  aurora box,
  colback=AuroraHighlightBg,
  borderline west={2pt}{0pt}{AuroraOrange}
}

% ---------------------------------------------------------------------------
%  Inline code
% ---------------------------------------------------------------------------
%  \inlinecode{...} wraps a short code fragment in a small grey box.
%  Appearance is controlled by \newtcbox so it works inside paragraphs.
% ---------------------------------------------------------------------------
\newtcbox{\inlinecode}{
  on line,
  enhanced,
  sharp corners,
  boxrule=0pt,
  colback=AuroraCodeBg,
  colframe=AuroraCodeBg,
  boxsep=1pt,
  left=2pt,
  right=2pt,
  top=1pt,
  bottom=1pt,
  fontupper=\ttfamily\small
}

% ---------------------------------------------------------------------------
%  Inline text highlight — \hlight{...}
% ---------------------------------------------------------------------------
%  Renders the argument in AuroraOrange.  Useful for drawing the reader's
%  eye to a key term without breaking the paragraph style.
% ---------------------------------------------------------------------------
\newcommand{\hlight}[1]{\textcolor{AuroraOrange}{#1}}

% ---------------------------------------------------------------------------
%  Code listings
% ---------------------------------------------------------------------------
%  The `AuroraListing` style defines the colours for keywords, comments,
%  strings, and line numbers.  The `code` environment is a thin wrapper
%  around lstlisting that applies this style.
%
%  To customise syntax highlighting for a specific language, set a
%  language-specific variant of AuroraListing.  To use a dark background,
%  change `backgroundcolor` and adjust the other colours for contrast.
% ---------------------------------------------------------------------------
\lstdefinestyle{AuroraListing}{
  basicstyle=\ttfamily\small,
  keywordstyle=\color{AuroraGreen}\bfseries,
  commentstyle=\color{AuroraMuted}\itshape,
  stringstyle=\color{AuroraRed},
  numberstyle=\tiny\color{AuroraMuted},
  showstringspaces=false,
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  frame=none,
  backgroundcolor=\color{white},
  aboveskip=0.65em,
  belowskip=0.65em,
  upquote=true
}
\lstnewenvironment{code}[1][]{%
  \lstset{style=AuroraListing,#1}%
}{}
\lstset{style=AuroraListing}

% ---------------------------------------------------------------------------
%  PGFPlots style
% ---------------------------------------------------------------------------
%  The `aurora` axis style sets a consistent width, height, grid, tick,
%  and legend format for all plots that opt in via
%  \begin{axis}[aurora, ...].  The width and height are relative to the
%  text block, so they scale when the page geometry changes.
% ---------------------------------------------------------------------------
\pgfplotsset{
  compat=1.18,
  aurora/.style={
    width=0.72\textwidth,
    height=0.42\textwidth,
    grid=both,
    minor tick num=1,
    major grid style={draw=AuroraGrid,line width=0.25pt,densely dotted},
    minor grid style={draw=AuroraGrid,line width=0.18pt,densely dotted},
    tick style={draw=none},
    axis line style={draw=black},
    label style={font=\small},
    tick label style={font=\small},
    legend style={draw=black,fill=white,font=\small}
  }
}

% ---------------------------------------------------------------------------
%  Theorem-like environments
% ---------------------------------------------------------------------------
%  The `aurora` theorem style uses italic body text with a bold blue
%  heading, followed by a period and a fixed space.  Theorems, definitions,
%  examples, and lemmas are all numbered per chapter.
%
%  To add a new environment (e.g. "Corollary"), call:
%    \newtheorem{corollary}{Corollary}[chapter]
% ---------------------------------------------------------------------------
\newtheoremstyle{aurora}
  {0.8em}
  {0.8em}
  {\itshape}
  {0pt}
  {\bfseries\color{AuroraBlue}}
  {.}
  {0.5em}
  {}
\theoremstyle{aurora}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{definition}{Definition}[chapter]
\newtheorem{exampletheorem}{Example}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
