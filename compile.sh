#!/bin/bash

rm -f ./{*.pdf,*.ps}
current_date="`date +%Y%m%d`";

latex rosario.tex
latex rosario.tex
dvips rosario.dvi
ps2pdf rosario.ps ${current_date}_rosario.pdf
rm -f ./{*.aux,*.dvi}