# Project Structure

This page explains the anatomy of an AuroraTeX project directory.

---

## Directory Layout

```text
AuroraTeX/                   ← project root
├── AuroraTeX.cls            ← class file (all visual definitions)
├── main.tex                 ← example main document (entry point)
├── references.bib           ← bibliography database
├── Makefile                 ← build automation
├── latexmkrc                ← latexmk configuration
├── LICENSE                  ← MIT license
├── .gitignore               ← exclude build artefacts from version control
├── README.md                ← project overview and quick start
│
├── docs/                    ← documentation
│   ├── README.md
│   ├── getting-started.md
│   ├── customization.md
│   ├── commands.md
│   ├── structure.md
│   └── build.md
│
├── figures/                 ← images and graphics
│   └── aurora-landscape.png
│
├── sections/                ← individual chapter / section files
│   ├── introduction.tex
│   └── plotting.tex
│
└── preview/                 ← preview screenshots (not part of the template)
    ├── preview1.png
    ├── preview2.png
    └── ...
```

---

## Key Files Explained

### `AuroraTeX.cls` — The Class File

This is the **engine** of the template.  It contains:

- Package loading (fonts, geometry, amsmath, tcolorbox, tikz, etc.)
- Colour palette definitions
- Chapter, section, subsection, and subsubsection formatting
- Table of contents layout
- Header and footer design
- Title page layout (`\maketitle`)
- Information box environments (`note`, `warning`, `example`, `highlight`)
- Code listing style
- PGFPlots axis style
- Theorem and definition environments

You should **not** need to modify `.cls` files directly in ordinary use —
AuroraTeX is designed so your content lives in `.tex` files.  However, the
class file is thoroughly commented to guide you when you do want to customise
the visual style.

### `main.tex` — The Main Document

This is the entry point.  It sets metadata (title, author, etc.), produces the
title page and global table of contents, and includes the chapter files from
`sections/`.

To start a new document, copy `main.tex` and edit the metadata fields.

### `sections/` — Chapter Files

Each chapter is stored as a separate `.tex` file.  This keeps long documents
manageable.  Name files descriptively (e.g. `methodology.tex`, `results.tex`)
and include them in order in your main file.

Example structure for a research report:

```text
sections/
├── introduction.tex
├── literature-review.tex
├── methodology.tex
├── experiments.tex
├── discussion.tex
└── conclusion.tex
```

### `figures/` — Images

Place all figures (PNG, PDF, JPG, EPS) in this directory.  Reference them
with relative paths:

```latex
\includegraphics{figures/chart.pdf}
```

### `references.bib` — Bibliography

A standard BibTeX database.  Supported types include `@article`, `@book`,
`@misc`, `@manual`, `@inproceedings`, etc.  Export references from Zotero,
Mendeley, or your reference manager in BibTeX format.

### `Makefile` — Build Automation

Three targets:

| Command | Effect |
|---|---|
| `make pdf` | Compile `main.tex` → `main.pdf` |
| `make clean` | Remove intermediate files |
| `make distclean` | Remove all generated files (including PDF) |

### `latexmkrc` — Compiler Settings

Configures `latexmk` to use **XeLaTeX** and run BibTeX as needed.
Only 3 lines — easy to tweak if you prefer LuaLaTeX or pdfLaTeX.

---

## Typical Workflow

1. Copy the template directory (or clone and `rm -rf .git` to start fresh).
2. Edit `main.tex` — update metadata, rename or reorder `\input` lines.
3. Create your own `.tex` files in `sections/`.
4. Place figures in `figures/`.
5. Add bibliography entries to `references.bib`.
6. Run `make pdf` to compile.
7. Open `main.pdf` and check the output.
8. Iterate.

---

## Version Control

The provided `.gitignore` covers all standard LaTeX build artefacts
(`*.aux`, `*.log`, `*.toc`, `*.bbl`, etc.) so you can safely version-control
your project with Git.  Only your source files and figures are tracked.
