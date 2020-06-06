#############
# Variables #
#############
current_date = `date +%Y%m%d`
a4_doc = rosario_angelus_a4
pray_doc = lavantarse_acostarse
output_name_a4 = ${current_date}_${a4_doc}
output_pray = ${current_date}_${pray_doc}
######################################################################################################################################################################

.PHONY = delete_a4 delete_wakeup move_aux

################
# Compila todo #
################
all: a4 wakeup
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

####################################
# Oraciones Levantarse y Aocstarse #
####################################
wakeup: delete_wakeup compile_wakeup move_aux

compile_wakeup:
	latexmk -lualatex -jobname=${output_pray} 01_oraciones_levantarse_acostarse.tex

delete_wakeup:
	rm -f ./*${pray_doc}.pdf
	rm -f aux/{*${pray_doc}.aux,*${pray_doc}.log,*${pray_doc}.fls,*${pray_doc}.fdb_latexmk,*${pray_doc}.dvi}
######################################################################################################################################################################

#############
# Genericos #
#############
move_aux:
	mv *.log *.aux *.fdb_latexmk *.fls *.out aux/







