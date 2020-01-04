#!/bin/bash

rm -f ./{*.aux,*.log,*.pdf,*.epub,*.azw3,*.html,*.dvi, *.ps}
current_date_time="`date +%Y%m%d`";

latex rosario.tex
dvips rosario.dvi
ps2pdf rosario.ps