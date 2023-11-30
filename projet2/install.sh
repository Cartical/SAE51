#!/bin/bash

#ETAPE 1 : creation des volumes nécessaire
docker volume create dolibarr_db
docker volume create dolibarr_html
docker volume create dolibarr_docs

docker network create sae51

#ETAPE 2 : creation du conteneur SGBD
docker run \
	--name mysql-cont \
	-p 3306:3306 \
	-v dolibarr_db:/var/lib/mysql \
	--env MYSQL_ROOT_PASSWORD=root \
	--env MYSQL_USER=dolibarr \
	--env MYSQL_PASSWORD=dolibarr \
	--env MYSQL_DATABASE=dolibarr \
	--env character_set_client=utf8 \
	--env character-set-server=utf8mb4 \
	--env collation-server=utf8mb4_unicode_ci \
	--network=sae51 \
	-d mysql:latest

sleep 10 #attente de 10 secondes pour être sûr que le sgbd soit accessible

#ETAPE 3 Creation de la BDD dolibarr:  
mysql mysql -u dolibarr -p'dolibarr' -h 127.0.0.1 --port=3306 < sql/dolibarr.sql 2>/dev/null

#ETAPE 4 : Création du conteneur dolibarr : 
docker run \
	-p 80:80 \
	--name dolibarr-cont \
	--env DOLI_DB_HOST=mysql-cont -d \
	--env DOLI_DB_NAME=dolibarr \
	--env DOLI_MODULES=modSociete\
	--env DOLI_ADMIN_LOGIN=calvin\
	--env DOLI_ADMIN_PASSWORD=arrive\
	--network=sae51 \
	upshift/dolibarr
