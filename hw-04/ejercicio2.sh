#!/bin/bash

DIA=`date +"%d"`
MES=`date +"%m"`
ANO=`date +"%Y"`
FECHA_HOY=`date +"%Y%m%d"`
DIA_SEMANA=`date +"%a"`

### Para pruebas fuerzo dia de la semana a domingo
#DIA_SEMANA='dom'
###

if [ -d ./backup/ariane.gutierrez/$ANO/$MES/$DIA/ ]; then
	echo "---> EL DIRECTORIO YA EXISTE"
	#rm -R ./backup/ariane.gutierrez/$ANO/$MES/$DIA #VAMOS A BORRARLO PARA LAS PRUEBAS
else
	echo "---> CREANDO EL DIRECTORIO CON LA FECHA DE HOY"
	mkdir -p ./backup/ariane.gutierrez/$ANO/$MES/$DIA/
	echo "---> COPIANDO EL LOG EN EL DIRECTORIO"
	cp -p ./nginx_logs_examples.log ./backup/ariane.gutierrez/$ANO/$MES/$DIA/nginx_log_requests_$FECHA_HOY.log

	if [ $DIA_SEMANA='dom' ]; then	# COMPROBAMOS SI ES DOMINGO
		echo "---> HOY ES DOMINGO, GUARDANDO LOS LOGS EN UNA CARPETA"
		mkdir -p ./nginx_logs_$FECHA_HOY/
		for i in 6 5 4 3 2 1 0
		do
			DIA_MENOS=`gdate +%d --date="-$i day"`
			MES_MENOS=`gdate +%m --date="-$i day"`
			ANO_MENOS=`gdate +%Y --date="-$i day"`
			if [ -d ./backup/ariane.gutierrez/$ANO_MENOS/$MES_MENOS/$DIA_MENOS/ ]; then # COMPROBAMOS QUE EL DIRECTORIO QUE QUEREMOS COPIAR EXISTE
				cp ./backup/ariane.gutierrez/$ANO_MENOS/$MES_MENOS/$DIA_MENOS/* ./nginx_logs_$FECHA_HOY/
			fi
			
		done
		echo "---> COMPRIMIENDO CARPETA"
		tar czvf nginx_logs_$FECHA_HOY.tar.gz nginx_logs_$FECHA_HOY/*
		rm -R ./nginx_logs_$FECHA_HOY/
	fi 
fi

