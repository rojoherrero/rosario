#!/bin/bash
rm -r output/*;
current_date_time="`date +%Y%m%d`";
asciidoctor -o output/${current_date_time}_devocionario.html devocionario.adoc;
echo Generating EBOOKS;
ebook-convert output/${current_date_time}_devocionario.html output/${current_date_time}_devocionario.epub;
ebook-convert output/${current_date_time}_devocionario.html output/${current_date_time}_devocionario.azw3 --no-inline-toc;
echo EBOOKS generated;
echo Generating PDF;
asciidoctor -r asciidoctor-pdf -b pdf -o output/${current_date_time}_devocionario.pdf devocionario.adoc;
asciidoctor -r asciidoctor-pdf -b pdf -o output/${current_date_time}_rosario-viaje.pdf rosario-viaje.adoc;
echo PDF generated;
