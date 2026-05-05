# =========================================================================
#  latexmk configuration for AuroraTeX
# =========================================================================
#  $pdf_mode = 5     -> use XeLaTeX to produce PDFs
#  -interaction=nonstopmode -> continue past errors when possible
#  -halt-on-error    -> stop on the first fatal error
#  $bibtex_use = 2   -> use biber/bibtex as appropriate (2 = bibtex)
#
#  If you prefer LuaLaTeX, change:
#    $pdf_mode = 4
#    $lualatex = 'lualatex -interaction=nonstopmode -halt-on-error %O %S'
# =========================================================================

$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$bibtex_use = 2;
