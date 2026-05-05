# Customization

AuroraTeX is designed to be easy to customise.  Almost every visual property
lives in **one file**: `AuroraTeX.cls`.  This guide covers the most common
tweaks.

---

## Changing the Colour Theme

All colours are defined near the top of `AuroraTeX.cls` (look for
`\definecolor`).  They are named semantically:

| Colour name | Role |
|---|---|
| `AuroraBlue` | Headings, links, citations, chapter title |
| `AuroraWine` | Chapter number, warning-box left rule |
| `AuroraGreen` | Example box, code keywords |
| `AuroraOrange` | Highlight box, `\hlight{}` text |
| `AuroraRed` | Code strings |
| `AuroraMuted` | Code comments, subtle text |
| `AuroraGrid` | Plot grid lines |
| `AuroraCodeBg` | Inline code background |
| `AuroraNoteBg` | Note/excerpt box background |
| `AuroraWarnBg` | Warning box background |
| `AuroraExampleBg` | Example box background |
| `AuroraHighlightBg` | Highlight box background |

To create your own palette, replace the hex values.  Example:

```latex
\definecolor{AuroraBlue}{HTML}{2D5F8A}
\definecolor{AuroraWine}{HTML}{6E1A3B}
\definecolor{AuroraGreen}{HTML}{1A6B3C}
```

---

## Changing Fonts

### With XeLaTeX / LuaLaTeX (recommended)

The font setup uses `fontspec`.  Any OpenType or TrueType font on your system
can be used.  In `AuroraTeX.cls`, find the `\setmainfont` / `\setsansfont` /
`\setmonofont` calls:

```latex
\IfFontExistsTF{TeX Gyre Heros}
  {\setmainfont{TeX Gyre Heros}\setsansfont{TeX Gyre Heros}}
  {\setmainfont{Latin Modern Sans}\setsansfont{Latin Modern Sans}}
```

Replace `TeX Gyre Heros` with your preferred sans-serif font, e.g.:

```latex
\setmainfont{Inter}
\setsansfont{Inter}
```

For Chinese documents using the `chinese` class option, configure fonts
through `ctex` instead:

```latex
\setCJKmainfont{Noto Sans CJK SC}
\setCJKsansfont{Noto Sans CJK SC}
```

### With pdfLaTeX

Replace `\RequirePackage{helvet}` with a different LaTeX font package
(e.g. `tgheros`, `fbb`, `newtxsf`).

---

## Page Margins

Edit the `geometry` options in `AuroraTeX.cls`:

```latex
\RequirePackage[
  top=2.5cm,
  right=2.0cm,
  bottom=2.5cm,
  left=3.0cm
]{geometry}
```

For two-sided printing (alternating margins), add `twoside` to the base
class options inside `\LoadClass`.

---

## Chapter & Section Styles

### Chapter number colour and size

The numbered chapter format is defined by `\titleformat{\chapter}`.  The
chapter number colour is `AuroraWine`; change it to any other colour:

```latex
{\color{AuroraWine}\fontsize{90}{94}\selectfont\thechapter}
           ^~~~~~~~~~ change this
```

The literal text "Chapter" can also be replaced:

```latex
{\fontsize{44}{50}\selectfont Chapter}
                              ^~~~~~~ e.g. "Unit"
```

### Section font size

Each heading level has its own `\titleformat` block.  Adjust the font sizes:

```latex
\titleformat{\section}
  {\normalfont\bfseries\color{AuroraBlue}\fontsize{18}{22}\selectfont}
                                          ^^ first number = font size
```

---

## Header & Footer

By default only the page number appears in the footer.  To add running
chapter and section titles, adjust the `\fancyhead` settings:

```latex
\fancyhead[LE]{\leftmark}   % left page, even — chapter
\fancyhead[RO]{\rightmark}  % right page, odd — section
\renewcommand{\headrulewidth}{0.4pt}
```

---

## Table of Contents

### Depth

`tocdepth` controls which levels appear in the table of contents.  Increase
to `3` to include subsubsections:

```latex
\setcounter{tocdepth}{3}
```

### Spacing

Adjust the vertical skip between chapter entries:

```latex
\setlength{\cftbeforechapskip}{1.05em}
```

---

## Code Listings

The `AuroraListing` style can be modified to use a dark background:

```latex
\lstdefinestyle{AuroraListing}{
  backgroundcolor=\color{black!5},
  basicstyle=\ttfamily\small\color{white},
  ...
}
```

For advanced syntax highlighting, add language-specific styles or replace
`listings` with `minted`.

---

## Adding New Box Environments

Add a new box with a custom colour:

```latex
\definecolor{MyBg}{HTML}{E8ECF1}

\newtcolorbox{mybox}{
  aurora box,
  colback=MyBg,
  borderline west={2pt}{0pt}{MyColour}
}
```

Use it as:

```latex
\begin{mybox}
   ...
\end{mybox}
```

---

## Adding New Theorem Environments

```latex
\theoremstyle{aurora}
\newtheorem{corollary}{Corollary}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
```

---

## Summary

| To change ... | Edit this in `AuroraTeX.cls` |
|---|---|
| Colours | `\definecolor{...}` definitions |
| Fonts | `\setmainfont{}` / `\setsansfont{}` |
| Page margins | `\RequirePackage[...]{geometry}` |
| Chapter style | `\titleformat{\chapter}[display]{...}` |
| Section style | `\titleformat{\section}{...}` |
| Header/footer | `\fancyhead` / `\fancyfoot` |
| ToC layout | `\setlength{\cft...}` |
| Code colours | `\lstdefinestyle{AuroraListing}{...}` |
| Box colours | `\newtcolorbox{...}{...}` |
| Theorem style | `\newtheoremstyle{aurora}{...}` |
| Plot style | `\pgfplotsset{aurora/.style={...}}` |
