#!/bin/bash
rm -r output/*;
current_date_time="`date +%Y%m%d%H%M%S`";
echo Generating ODT;
pandoc rosario.md -s -o output/${current_date_time}_rosario.odt;
echo ODT generated
echo Generating HTML;
pandoc rosario.md -s -o output/${current_date_time}_rosario.html --ascii;
echo HTML generated;
echo Generating MOBI
pandoc rosario.md -s -o output/temp_rosario.epub;
ebook-convert output/temp_rosario.epub output/${current_date_time}_rosario.mobi;
echo MOBI generated
echo Generating PDF;
ebook-convert output/temp_rosario.epub output/${current_date_time}_rosario.pdf;
echo PDF generated;
rm output/temp_rosario.epub;
