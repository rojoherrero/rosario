#!/bin/bash
rm -r output/*;
current_date_time="`date +%Y%m%d%H%M%S`";
pandoc rosario.md --self-contained --standalone --ascii --table-of-contents -o output/${current_date_time}_rosario.html;
echo Generating EBOOKS
#pandoc rosario.md --self-contained --standalone -o output/${current_date_time}_rosario.epub;
ebook-convert output/${current_date_time}_rosario.html output/${current_date_time}_rosario.epub;
ebook-convert output/${current_date_time}_rosario.html output/${current_date_time}_rosario.mobi;
echo EBOOKS generated
echo Generating PDF;
ebook-convert output/${current_date_time}_rosario.html output/${current_date_time}_rosario.pdf;
echo PDF generated;
