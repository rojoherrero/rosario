#!/bin/bash
rm -rf output/*;
current_date_time="`date +%Y%m%d%H%M%S`";
echo Generating ODT;
pandoc rosario.md -s -o output/${current_date_time}_rosario.odt;
echo ODT generated
echo Generating HTML;
pandoc rosario.md --css style.css --self-contained  -o output/${current_date_time}_rosario.html --ascii;
echo HTML generated;
echo Generating PDF;
pandoc config/pdf-config.yaml rosario.md -s -o output/${current_date_time}_rosario.pdf 
echo PDF generated;
