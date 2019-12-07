#!/bin/bash

rm -f ./output/{*.aux,*.log,*.pdf,*.epub,*.azw3,*.html,*.dvi}
current_date_time="`date +%Y%m%d`";
pdflatex -halt-on-error -output-directory=./output -output-format=pdf -jobname=${current_date_time}_devocionario devocionario.tex 