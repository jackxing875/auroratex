# Build & Compile

How to compile an AuroraTeX document on different platforms.

---

## Recommended Setup

| Component | Recommendation |
|---|---|
| **Compiler** | XeLaTeX |
| **Build tool** | `latexmk` (automated multi-pass compilation) |
| **Viewer** | Any PDF viewer |

---

## Linux

### Install TeX Live

```bash
# Debian / Ubuntu
sudo apt install texlive texlive-xetex texlive-latex-extra latexmk

# Fedora
sudo dnf install texlive-scheme-full
```

### Compile

```bash
make pdf
# Equivalent to:
latexmk -xelatex main.tex
```

---

## macOS

### Install MacTeX

Download from [tug.org/mactex](https://tug.org/mactex/).  MacTeX includes
XeLaTeX, latexmk, and all required packages.

### Compile

```bash
make pdf
```

---

## Windows

### Option A: TeX Live

Install from [tug.org/texlive](https://tug.org/texlive/), then use PowerShell
or Command Prompt:

```cmd
latexmk -xelatex main.tex
```

### Option B: MiKTeX

Install from [miktex.org](https://miktex.org/).  Missing packages will be
installed automatically on first use.

### Option C: VS Code + LaTeX Workshop

1. Install VS Code and the LaTeX Workshop extension.
2. Open the `AuroraTeX/` directory.
3. The `latexmkrc` file is detected automatically.
4. Press `Ctrl+Alt+B` to build.

---

## Overleaf

1. Upload the ZIP to Overleaf.
2. Go to **Menu** → **Compiler** → select **XeLaTeX**.
3. Click **Recompile**.

---

## Common Issues

### "Package not found"

Install the missing package via your TeX distribution's package manager:

```bash
# TeX Live
tlmgr install <package-name>

# MiKTeX — missing packages install automatically
```

### C compiler warnings from `fontspec`

These are harmless warnings from Lua code inside `fontspec`.  They do not
affect the output PDF.

### Chinese characters don't appear

Make sure you:

1. Pass the `chinese` option: `\documentclass[chinese]{AuroraTeX}`
2. Use **XeLaTeX** or LuaLaTeX (Chinese does not work with pdfLaTeX)
3. Have a CJK font installed (e.g. Noto Sans CJK)

### "File `references.bib` not found"

Ensure `\bibliography{references}` matches the filename (without the `.bib`
extension).  The file must be in the same directory or a directory that
BibTeX searches.

### Compilation hangs or takes too long

Large PGFPlots figures with many samples can be slow.  Reduce `samples` during
drafting and increase it for the final version.  For external plots, consider
compiling them separately with `\tikzexternalize`.

---

## Changing the Compiler

### Switch to LuaLaTeX

Edit `latexmkrc`:

```perl
$pdf_mode = 4;
$lualatex = 'lualatex -interaction=nonstopmode -halt-on-error %O %S';
```

Then compile with `make pdf` as usual.

### Switch to pdfLaTeX (English-only)

Edit `latexmkrc`:

```perl
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
```

Note: pdfLaTeX cannot use system OpenType fonts and does not support the
`chinese` option.  The template will fall back to the `helvet` package for
a sans-serif look.

---

## Continuous Integration

To compile on GitHub Actions, add a workflow file `.github/workflows/build.yml`:

```yaml
name: Build LaTeX document
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Compile
        uses: xu-cheng/latex-action@v3
        with:
          root_file: main.tex
          latexmk_use_xelatex: true
```

The compiled PDF can then be uploaded as a build artifact.
