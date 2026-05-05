# ===========================================================================
#  AuroraTeX — build automation via latexmk
# ===========================================================================
#  Prerequisites: a LaTeX distribution with XeLaTeX and the packages listed
#  in AuroraTeX.cls (texlive-latexrecommended, texlive-latexextra, etc.).
#
#  Targets:
#    make pdf       Compile main.tex into main.pdf (runs bibtex as needed)
#    make clean     Remove intermediate files, keep the PDF
#    make distclean Remove all generated files including the PDF
# ===========================================================================

.PHONY: pdf clean distclean

pdf:
	latexmk -xelatex main.tex

clean:
	latexmk -c main.tex

distclean:
	latexmk -C main.tex
