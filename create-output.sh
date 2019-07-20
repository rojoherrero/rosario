#!/bin/bash
rm -rf output/*;
current_date_time="`date +%Y%m%d%H%M%S`";
echo Generating markdown;
pandoc -s rosario.tex -o output/${current_date_time}_rosario.md;
echo markdown generated;
echo Generating HTML;
pandoc -s rosario.tex -o output/${current_date_time}_rosario.html --ascii;
echo HTML generated;
echo Compiling to PDF;
pdflatex -output-directory=output/ -jobname=${current_date_time}_rosario rosario.tex > /dev/null 2>&1;
rm -rf output/${current_date_time}_rosario.aux output/${current_date_time}_rosario.out;
echo PDF generated;
echo DONE;
