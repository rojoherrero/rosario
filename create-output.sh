#!/bin/bash
current_date_time="`date +%Y%m%d`";
pdflatex -jobname=${current_date_time}_devocionario devocionario.tex