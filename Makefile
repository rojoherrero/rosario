current_date = `date +%Y%m%d`
output_name_long = ${current_date}_rosario_angelus
output_name_short = ${current_date}_rosario_angelus_corto

.PHONY = delete_short delete_long clean_aux clean_all

all: clean_all compile_long compile_short move_aux

compile_long:
	latexmk -lualatex -jobname=${output_name_long} L00_main.tex

compile_short:
	latexmk -lualatex -jobname=${output_name_short} C00_main_latin.tex

long: clean_aux delete_long compile_long move_aux

short: clean_aux delete_short compile_short move_aux

move_aux:
	mv *.log *.aux *.fdb_latexmk *.fls aux/

clean_all: clean_aux delete_long delete_short

delete_short:
	rm -f ./*rosario_angelus_corto.pdf

delete_long:
	rm -f ./*rosario_angelus.pdf

clean_aux:
	@echo "cleaning aux files..."
	rm -f aux/{*.aux,*.log,*.fls,*.fdb_latexmk,*.dvi} 