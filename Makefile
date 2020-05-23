#############
# Variables #
#############
current_date = `date +%Y%m%d`
a4_doc = rosario_angelus_a4
a5_doc = rosario_angelus_a5
output_name_a4 = ${current_date}_${a4_doc}
output_name_a5 = ${current_date}_${a5_doc}
######################################################################################################################################################################

.PHONY = compile_a5 compile_a4 move_aux

################
# Compila todo #
################
all: a4 a5 move_aux
######################################################################################################################################################################

############################
# Compila la version larga #
############################
a4: delete_a4 compile_a4 move_aux

compile_a4:
	latexmk -lualatex -jobname=${output_name_a4} 00_rosario_bilingue_a4.tex

delete_a4:
	rm -f ./*${a4_doc}.pdf
	rm -f aux/{*${a4_doc}.aux,*${a4_doc}.log,*${a4_doc}.fls,*${a4_doc}.fdb_latexmk,*${a4_doc}.dvi}
######################################################################################################################################################################

############################
# Compila la version larga #
############################
a5: delete_a5 compile_a5 move_aux

compile_a5:
	latexmk -lualatex -jobname=${output_name_a5} 00_rosario_bilingue_a5.tex

delete_a5:
	rm -f ./*${a5_doc}.pdf
	rm -f aux/{*${a5_doc}.aux,*${a5_doc}.log,*${a5_doc}.fls,*${a5_doc}.fdb_latexmk,*${a5_doc}.dvi}
######################################################################################################################################################################

#############
# Genericos #
#############
move_aux:
	mv *.log *.aux *.fdb_latexmk *.fls aux/







