# AuroraTeX

> A clean, modern, and customizable LaTeX report template for academic reports, course projects, and technical notes.

AuroraTeX is a LaTeX report template designed for students, researchers, and developers who want to write elegant academic reports without spending too much time fighting with formatting.

It provides a polished chapter style, clean section hierarchy, comfortable page geometry, customizable colors, and commonly used environments for figures, tables, equations, notes, and code blocks.

Whether you are writing a course report, lab report, technical note, reading summary, or small research document, AuroraTeX gives you a beautiful starting point.

---


## Features

- Clean and modern chapter title design
- Elegant table of contents layout
- Well-tuned page margins and typography
- Custom section, subsection, and subsubsection styles
- Built-in support for figures and tables
- Highlighted note/warning boxes
- Equation, theorem, definition, and example environments
- Code block support
- Easy color and layout customization
- Suitable for both academic and technical writing

---

## Use Cases

AuroraTeX is suitable for:

- Course reports
- Lab reports
- Reading notes
- Technical documentation
- Research summaries
- Project reports
- Mathematical notes
- Undergraduate assignments

---

## Quick Start

### Option 1: Use with Overleaf

1. Download this repository as a ZIP file.
2. Open [Overleaf](https://www.overleaf.com/).
3. Create a new project.
4. Choose **Upload Project**.
5. Upload the ZIP file.
6. Set the main file to `main.tex`.
7. Compile the document.

Recommended compiler:

```text
XeLaTeX
````

If you do not use Chinese characters or custom fonts, `pdfLaTeX` may also work depending on your configuration.

---

### Option 2: Compile Locally

Make sure you have a LaTeX distribution installed.

For Linux/macOS:

```bash
latexmk -xelatex main.tex
```

For Windows, you can use TeX Live, MiKTeX, or compile directly through VS Code with the LaTeX Workshop extension.

---

## Project Structure

```text
AuroraTeX/
├── main.tex              # Main document
├── AuroraTeX.cls         # Template class file
├── references.bib        # Bibliography file
├── figures/              # Images and figures
├── assets/               # README preview images
├── sections/             # Chapter or section files
│   ├── introduction.tex
│   ├── formatting.tex
│   └── examples.tex
└── README.md
```

---

## Basic Usage

A minimal document looks like this:

```latex
\documentclass{AuroraTeX}

\title{AuroraTeX Template}
\author{Your Name}
\date{\today}

\begin{document}

\maketitle
\tableofcontents

\chapter{Introduction}

This is a simple example of an AuroraTeX document.

\section{Motivation}

AuroraTeX is designed to make academic report writing cleaner and easier.

\end{document}
```

---

## Figures

You can insert figures in the standard LaTeX way:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/example.png}
    \caption{An example figure.}
    \label{fig:example}
\end{figure}
```

Then refer to it using:

```latex
Figure~\ref{fig:example}
```

---

## Tables

```latex
\begin{table}[htbp]
    \centering
    \caption{An example table.}
    \label{tab:example}
    \begin{tabular}{ccc}
        \toprule
        Method & Accuracy & Time \\
        \midrule
        Baseline & 85.2\% & 1.20s \\
        Ours & 91.7\% & 0.95s \\
        \bottomrule
    \end{tabular}
\end{table}
```

---

## Equations

```latex
\begin{equation}
    E = mc^2
\end{equation}
```

For aligned equations:

```latex
\begin{align}
    y &= Wx + b \\
    \hat{y} &= \mathrm{softmax}(y)
\end{align}
```

---

## Notes and Highlight Boxes

AuroraTeX provides highlighted boxes for important information.

```latex
\begin{note}
This is a note box. You can use it to emphasize important ideas.
\end{note}
```

```latex
\begin{warning}
This is a warning box. You can use it for common mistakes or important reminders.
\end{warning}
```

---

## Code Blocks

```latex
\begin{lstlisting}[language=Python]
def hello():
    print("Hello, AuroraTeX!")
\end{lstlisting}
```

You may customize the code style in `AuroraTeX.cls`.

---

## Customization

Most visual settings can be changed in the class file:

```text
AuroraTeX.cls
```

Common customization options include:

* Theme color
* Chapter title style
* Section title style
* Page margins
* Font settings
* Header and footer style
* Note box colors
* Code block appearance

For example, you can change the main theme color by modifying the color definition:

```latex
\definecolor{AuroraBlue}{HTML}{005F87}
```

---

## Recommended Compiler

The recommended compiler is:

```text
XeLaTeX
```

This is especially useful if you want to use custom fonts or write Chinese content.

For English-only documents, `pdfLaTeX` may also work.

---

## Roadmap

* [ ] Add Chinese report example
* [ ] Add English report example
* [ ] Add thesis-style title page
* [ ] Add more theorem-like environments
* [ ] Add better code block themes
* [ ] Add GitHub Actions build workflow
* [ ] Add Overleaf usage guide
* [ ] Add documentation for customization

---

## Contributing

Contributions are welcome.

You can help by:

* Reporting bugs
* Improving documentation
* Adding examples
* Optimizing layout
* Creating new themes
* Testing the template on different LaTeX distributions

Feel free to open an issue or submit a pull request.

---

## License

This project is released under the MIT License.

You are free to use, modify, and distribute this template for personal, academic, and commercial purposes.

---

## Acknowledgements

AuroraTeX is inspired by modern academic report templates, clean typography, and the desire to make LaTeX writing less painful and more beautiful.

Special thanks to the open-source LaTeX community.

---

## Citation

If you find this template useful, you may cite or mention it as:

```bibtex
@misc{auroratex,
  author       = {Your Name},
  title        = {AuroraTeX: A Modern LaTeX Report Template},
  year         = {2026},
  howpublished = {\url{https://github.com/your-username/AuroraTeX}}
}
```

