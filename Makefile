#############
# Variables #
#############
current_date = `date +%Y%m%d`
castellano = rosario_castellano
castellano_meditado = rosario_castellano_meditado
latin = rosario_latin
latin_meditado = rosario_latin_meditado
long = rosario_angelus
output_name_long = ${current_date}_${long}
output_name_latin = ${current_date}_${latin}
output_name_latin_meditado = ${current_date}_${latin_meditado}
output_name_castellano = ${current_date}_${castellano}
output_name_castellano_meditado = ${current_date}_${castellano_meditado}
######################################################################################################################################################################

.PHONY = delete_long delete_latin delete_castellano

################
# Compila todo #
################
all: delete_long delete_latin delete_castellano compile_long compile_latin compile_castellano move_aux
######################################################################################################################################################################

############################
# Compila la version larga #
############################
long: delete_long compile_long move_aux

compile_long:
	latexmk -lualatex -jobname=${output_name_long} 00_rosario_angelus_oraciones_bilingue.tex

delete_long:
	rm -f ./*${long}.pdf
	rm -f aux/{*${long}.aux,*${long}.log,*${long}.fls,*${long}.fdb_latexmk,*${long}.dvi}
######################################################################################################################################################################

####################################
# Compila sólo la versión en latín #
####################################
latin: delete_latin compile_latin move_aux

compile_latin:
	latexmk -lualatex -jobname=${output_name_latin} 01_rosario_latin.tex

delete_latin:
	rm -f ./*${latin}.pdf
	rm -f aux/{*${latin}.aux,*${latin}.log,*${latin}.fls,*${latin}.fdb_latexmk,*${latin}.dvi}
######################################################################################################################################################################

#############################################
# Compila sólo la versión en latín meditado #
#############################################
latin_meditado: delete_latin_meditado compile_latin_meditado move_aux

compile_latin_meditado:
	latexmk -lualatex -jobname=${output_name_latin_meditado} 01_rosario_latin_meditado.tex

delete_latin_meditado:
	rm -f ./*${latin_meditado}.pdf
	rm -f aux/{*${latin_meditado}.aux,*${latin_meditado}.log,*${latin_meditado}.fls,*${latin_meditado}.fdb_latexmk,*${latin_meditado}.dvi}
######################################################################################################################################################################

########################################
# Compila sólo la versio en castellano #
########################################
castellano: delete_castellano compile_castellano move_aux

compile_castellano:
	latexmk -lualatex -jobname=${output_name_castellano} 02_rosario_castellano.tex

delete_castellano:
	rm -f ./*${castellano}.pdf
	rm -f aux/{*${castellano}.aux,*${castellano}.log,*${castellano}.fls,*${castellano}.fdb_latexmk,*${castellano}.dvi}
######################################################################################################################################################################

#################################################
# Compila sólo la versio en castellano meditado #
#################################################
castellano_meditado: delete_castellano_meditado compile_castellano_meditado move_aux

compile_castellano_meditado:
	latexmk -lualatex -jobname=${output_name_castellano_meditado} 02_rosario_castellano.tex

delete_castellano_meditado:
	rm -f ./*${castellano_meditado}.pdf
	rm -f aux/{*${castellano_meditado}.aux,*${castellano_meditado}.log,*${castellano_meditado}.fls,*${castellano_meditado}.fdb_latexmk,*${castellano_meditado}.dvi}
######################################################################################################################################################################

#############
# Genericos #
#############
move_aux:
	mv *.log *.aux *.fdb_latexmk *.fls aux/







