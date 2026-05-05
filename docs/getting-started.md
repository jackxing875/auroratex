# Getting Started

This guide walks you through setting up AuroraTeX and producing your first
report.

---

## Prerequisites

You need a working LaTeX distribution:

| OS | Recommended distribution |
|---|---|
| **Linux** | TeX Live (full or `texlive-latexrecommended` + `texlive-latexextra`) |
| **macOS** | MacTeX |
| **Windows** | TeX Live or MiKTeX |

AuroraTeX uses **XeLaTeX** as the recommended compiler.  pdfLaTeX also works
for English-only documents, though font selection is more limited.

Verify your installation:

```bash
xelatex --version
```

---

## Option 1 — Compile Locally (recommended)

### Step 1: Clone or download

```bash
git clone https://github.com/JackXing875/AuroraTeX.git
cd AuroraTeX
```

Or download the ZIP from GitHub and extract it.

### Step 2: Compile

```bash
make pdf
```

This invokes `latexmk -xelatex main.tex`, which handles cross-references and
bibliography automatically.  After compilation you will find `main.pdf` in the
project root.

To clean intermediate files:

```bash
make clean       # keep the PDF
make distclean   # remove everything including the PDF
```

### Step 3: Open and read

Open `main.pdf` with any PDF viewer.  The example document demonstrates
all of AuroraTeX's features and environments.

---

## Option 2 — Use Overleaf

1. Download this repository as a ZIP file.
2. Go to [Overleaf](https://www.overleaf.com/) and create a new project.
3. Choose **Upload Project** and select the ZIP.
4. Set the **main document** to `main.tex`.
5. Set the **compiler** to **XeLaTeX** (Menu → Compiler).
6. Click **Recompile**.

---

## Option 3 — VS Code with LaTeX Workshop

1. Install the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.
2. Open the `AuroraTeX/` folder in VS Code.
3. Open `main.tex` and press `Ctrl+Alt+B` (or `Cmd+Alt+B` on macOS) to build.
4. The default recipe should use `latexmk` with XeLaTeX because of the
   `latexmkrc` file in the project root.

---

## Writing Your First Report

Create a copy of `main.tex` with a different name, e.g. `report.tex`:

1. In `report.tex`, set your title, author, and metadata:

   ```latex
   \title{My Report}
   \author{Your Name}
   \email{your.email@example.edu}
   \date{\today}
   ```

2. Create your own chapter files in `sections/`:

   ```latex
   % sections/intro.tex
   \chapter{Introduction}
   Lorem ipsum dolor sit amet ...
   ```

3. Include them in your main file:

   ```latex
   \begin{document}
   \maketitle
   \tableofcontents
   \input{sections/intro}
   \end{document}
   ```

4. Compile:

   ```bash
   latexmk -xelatex report.tex
   ```

---

## Where to Go Next

- [Customization](customization.md) — change colours, fonts, spacing, and more
- [Command Reference](commands.md) — every command and environment explained
- [Build & Compile](build.md) — troubleshooting compiler issues
