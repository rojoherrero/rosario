#############
# Variables #
#############
current_date = `date +%Y%m%d`
rosary_doc = rosario_angelus_a4
wakeup_doc = lavantarse
sleep_doc = acostarse
week_doc = semana_santificada
week_sp_doc = semana_santificada_castellano
output_rosary = ${current_date}_${rosary_doc}
output_wakeup = ${current_date}_${wakeup_doc}
output_sleep = ${current_date}_${sleep_doc}
output_week = ${current_date}_${week_doc}
output_week_sp = ${current_date}_${week_sp}
######################################################################################################################################################################

.PHONY = delete_a4 delete_wakeup move_aux

################
# Compila todo #
################
all: a4 wakeup sleep week week_sp
######################################################################################################################################################################

############################
# Compila la version larga #
############################
a4: delete_a4 compile_a4 move_aux

compile_a4:
	latexmk -lualatex -jobname=${output_rosary} 00_rosario_bilingue_a4.tex

delete_a4:
	rm -f ./*${rosary_doc}.pdf
	rm -f aux/{*${rosary_doc}.aux,*${rosary_doc}.log,*${rosary_doc}.fls,*${rosary_doc}.fdb_latexmk,*${rosary_doc}.dvi}
######################################################################################################################################################################

########################
# Oraciones Levantarse #
########################
wakeup: delete_wakeup compile_wakeup move_aux

compile_wakeup:
	latexmk -lualatex -jobname=${output_wakeup} 01_levantarse.tex

delete_wakeup:
	rm -f ./*${wakeup_doc}.pdf
	rm -f aux/{*${wakeup_doc}.aux,*${wakeup_doc}.log,*${wakeup_doc}.fls,*${wakeup_doc}.fdb_latexmk,*${wakeup_doc}.dvi}
######################################################################################################################################################################

#######################
# Oraciones Acostarse #
#######################
sleep: delete_sleep compile_sleep move_aux

compile_sleep:
	latexmk -lualatex -jobname=${output_sleep} 02_acostarse.tex

delete_sleep:
	rm -f ./*${sleep_doc}.pdf
	rm -f aux/{*${sleep_doc}.aux,*${sleep_doc}.log,*${sleep_doc}.fls,*${sleep_doc}.fdb_latexmk,*${sleep_doc}.dvi}
######################################################################################################################################################################

######################
# Semana Santificada #
######################
week: delete_week compile_week move_aux

compile_week:
	latexmk -lualatex -jobname=${output_week} 03_semana.tex

delete_week:
	rm -f ./*${week_doc}.pdf
	rm -f aux/{*${week_doc}.aux,*${week_doc}.log,*${week_doc}.fls,*${week_doc}.fdb_latexmk,*${week_doc}.dvi}
######################################################################################################################################################################

#################################
# Semana Santificada Castellano #
#################################
week_sp: delete_sp_week compile_sp_week move_aux

compile_sp_week:
	latexmk -lualatex -jobname=${output_week_sp} 03_semana_castellano.tex

delete_sp_week:
	rm -f ./*${week_sp_doc}.pdf
	rm -f aux/{*${week_sp_doc}.aux,*${week_sp_doc}.log,*${week_sp_doc}.fls,*${week_sp_doc}.fdb_latexmk,*${week_sp_doc}.dvi}
######################################################################################################################################################################

#############
# Genericos #
#############
move_aux:
	mv *.log *.aux *.fdb_latexmk *.fls *.out aux/







