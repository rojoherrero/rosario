#!/bin/bash

current_date="`date +%Y%m%d`";
output_name=${current_date}_rosary

# clean all output folders
rm -f ./*.pdf aux/{*.aux,*.log,*.fls,*.fdb_latexmk,*.dvi} 

# compile the tex file
latexmk -pdf -jobname=${output_name} rosary.tex

# I'm doing this because latexmk on linux doesn't allow to put different
# output and aux directories
mv *.log *.aux *.fdb_latexmk *.fls *.dvi aux/
