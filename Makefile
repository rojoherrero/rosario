current_date = `date +%Y%m%d`
castellano = rosario_castellano
latin = rosario_latin
long = rosario_angelus
output_name_long = ${current_date}_${long}
output_name_latin = ${current_date}_${latin}
output_name_castellano = ${current_date}_${castellano}

.PHONY = delete_short delete_long clean_aux clean_all

all: delete_long delete_latin delete_castellano compile_long compile_latin compile_castellano move_aux

#Compila la version larga
long: delete_long compile_long move_aux

compile_long:
	latexmk -lualatex -jobname=${output_name_long} 00_rosario_angelus_oraciones_castellano_latin.tex

delete_long:
	rm -f ./*${long}.pdf
	rm -f aux/{*${long}.aux,*${long}.log,*${long}.fls,*${long}.fdb_latexmk,*${long}.dvi} 

#Compila sólo la versión en latín
latin: delete_latin compile_latin move_aux

compile_latin:
	latexmk -lualatex -jobname=${output_name_latin} 01_rosario_latin.tex

delete_latin:
	rm -f ./*${latin}.pdf
	rm -f aux/{*${latin}.aux,*${latin}.log,*${latin}.fls,*${latin}.fdb_latexmk,*${latin}.dvi} 

#Compila sólo la versio en castellano
castellano: delete_castellano compile_castellano move_aux

compile_castellano:
	latexmk -lualatex -jobname=${output_name_castellano} 02_rosario_castellano.tex

delete_castellano:
	rm -f ./*${castellano}.pdf
	rm -f aux/{*${castellano}.aux,*${castellano}.log,*${castellano}.fls,*${castellano}.fdb_latexmk,*${castellano}.dvi} 	

#Genericos
move_aux:
	mv *.log *.aux *.fdb_latexmk *.fls aux/







