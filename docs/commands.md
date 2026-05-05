# Command Reference

This page documents every command and environment provided by AuroraTeX
beyond the standard LaTeX set.

---

## Document-Level Commands

These commands are used in the preamble (before `\begin{document}`) to
set metadata for the title page and bibliography.

| Command | Argument | Required | Description |
|---|---|---|---|
| `\documentclass{AuroraTeX}` | `[chinese]` | Yes | Load the AuroraTeX template. Add `chinese` for CJK support. |
| `\title{...}` | text | Yes | Document title (centre of title page). |
| `\subtitle{...}` | text | No | Subtitle (displayed below title, smaller). |
| `\author{...}` | text | Yes | Author name. |
| `\email{...}` | text | No | Email address (displayed below author). |
| `\date{...}` | text | No | Date; use `{}` to suppress, `\today` for today's date. |
| `\studentname{...}` | text | No | Student name (bottom-right metadata table). |
| `\studentnumber{...}` | text | No | Student or ID number. |
| `\modulename{...}` | text | No | Module or course name. |
| `\institution{...}` | text | No | Institution or university name. |

---

## Chapter & Section Commands

| Command | Description |
|---|---|
| `\Chapter{title}` | Numbered chapter **with** a local mini table of contents. |
| `\chapter{title}` | Standard numbered chapter (no mini ToC). |
| `\section{title}` | Numbered section. |
| `\subsection{title}` | Numbered subsection. |
| `\subsubsection{title}` | Numbered subsubsection. |
| `\chapter*{title}` | Unnumbered chapter (e.g. for Acknowledgements). |

---

## Information Boxes

All boxes are flat, breakable, and use a coloured left rule.

### `note` / `excerpt`
- **Appearance:** Blue left rule, light-blue background
- **Semantics:** Important information, key results, quotations
- **Usage:**
  ```latex
  \begin{note}
     ...
  \end{note}
  ```

### `warning`
- **Appearance:** Wine-red left rule, light-pink background
- **Semantics:** Warnings, common mistakes, important caveats
- **Usage:**
  ```latex
  \begin{warning}
     ...
  \end{warning}
  ```

### `example` / `examplebox`
- **Appearance:** Green left rule, light-green background
- **Semantics:** Worked examples, demonstrations
- **Usage:**
  ```latex
  \begin{example}
     ...
  \end{example}
  ```

### `highlight` / `highlightbox`
- **Appearance:** Orange left rule, light-yellow background
- **Semantics:** Key takeaways, summaries, conclusions
- **Usage:**
  ```latex
  \begin{highlight}
     ...
  \end{highlight}
  ```

---

## Inline Commands

### `\inlinecode{text}`
Formats a short code fragment inside a paragraph.  Rendered in monospace
with a light-grey background.

```latex
Use \inlinecode{\textbackslash Chapter\{...\}} for full chapter styling.
```

### `\hlight{text}`
Highlights a word or phrase in AuroraOrange.

```latex
This is \hlight{very important} for the analysis.
```

---

## Code Blocks

### `lstlisting` environment (with AuroraListing style)

Use the standard `lstlisting` environment with `style=AuroraListing`:

```latex
\begin{lstlisting}[language=Python,style=AuroraListing]
def hello():
    print("Hello, AuroraTeX!")
\end{lstlisting}
```

The `AuroraListing` style defines keyword, comment, string, and number colours
as described in [Customization](customization.md).

---

## Theorem Environments

All theorem environments use the `aurora` style (italic body, bold blue
heading) and are numbered per chapter.

| Environment | Printed as |
|---|---|
| `theorem` | **Theorem 1.1.** |
| `definition` | **Definition 1.1.** |
| `exampletheorem` | **Example 1.1.** |
| `lemma` | **Lemma 1.1.** |

Usage:

```latex
\begin{theorem}[Pythagorean theorem]
   For a right triangle with legs $a$, $b$ and hypotenuse $c$,
   $a^2 + b^2 = c^2$.
\end{theorem}
```

---

## PGFPlots

The `aurora` axis style provides consistent grid, tick, label, and legend
formatting:

```latex
\begin{tikzpicture}
  \begin{axis}[
    aurora,
    xlabel={$x$},
    ylabel={$f(x)$}
  ]
    \addplot[red, very thick] {x^2};
  \end{axis}
\end{tikzpicture}
```

See `sections/plotting.tex` for complete 2D and 3D examples.

---

## Tables

Use the standard LaTeX table environment with `booktabs` rules for
publication-quality output:

```latex
\begin{table}[htbp]
  \centering
  \caption{My table.}
  \label{tab:my}
  \begin{tabular}{lccc}
    \toprule
    ...
    \midrule
    ...
    \bottomrule
  \end{tabular}
\end{table}
```

AuroraTeX loads `tabularx` and `multirow` for more complex layouts.
Avoid vertical rules — use horizontal rules and whitespace instead.

---

## Figures

Standard LaTeX figure workflow:

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=\linewidth]{figures/my-image.png}
  \caption{Caption text.}
  \label{fig:my}
\end{figure}
```

Supported image formats (XeLaTeX): PNG, JPG, PDF, EPS.

---

## Bibliography

AuroraTeX uses **natbib** with `plainnat` style.  Place your bibliography
entries in `references.bib`:

```latex
\bibliographystyle{plainnat}
\bibliography{references}
```

Citation commands:

| Command | Output |
|---|---|
| `\citep{key}` | (Author, Year) |
| `\citet{key}` | Author (Year) |
| `\nocite{*}` | Include all entries even if uncited |

---

## Hooks

For custom preamble additions (e.g. extra packages), edit `AuroraTeX.cls`
or add them **after** `\documentclass{AuroraTeX}` in your main `.tex`
file.

```latex
\documentclass{AuroraTeX}

% Your custom packages
\usepackage{siunitx}
\usepackage{minted}

\begin{document}
...
\end{document}
```
