#!/bin/bash
rm -r output/*;
current_date_time="`date +%Y%m%d%H%M%S`";
echo Generating EBOOKS
pandoc rosario.md -s -o output/${current_date_time}_rosario.epub;
ebook-convert output/${current_date_time}_rosario.epub output/${current_date_time}_rosario.mobi;
echo EBOOKS generated
echo Generating PDF;
ebook-convert output/${current_date_time}_rosario.epuboutput/${current_date_time}_rosario.pdf;
echo PDF generated;
