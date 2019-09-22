#!/bin/bash
rm -r output/*;
current_date_time="`date +%Y%m%d`";
asciidoctor -o output/${current_date_time}_devocionario.html devocionario.adoc;
echo Generating EBOOKS;
ebook-convert output/${current_date_time}_devocionario.html output/${current_date_time}_devocionario.epub;
ebook-convert output/${current_date_time}_devocionario.html output/${current_date_time}_devocionario.azw3 --no-inline-toc;
echo EBOOKS generated;
