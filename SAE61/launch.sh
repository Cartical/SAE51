#!/bin/bash

docker network create --driver=bridge sae61
docker network ls

# Construire les images Docker
docker build -t jinjaflask -f Dockerfile_flask .

docker build -t sql_img -f Dockerfile_sql .

# Exécuter les conteneurs Docker
docker run -d \
	-p 3307:3306 \
	-v vol-sql-demo:/var/lib/mysql \
	--name mysql_cont \
	--env MYSQL_ROOT_PASSWORD=foo \
	--network=sae61 \
	sql_img

sleep 20
#./filldb.sh

# run conteneur flask
docker run \
	-p 5000:5000 \
	--network=sae61 \
	--name flask_cont \
	jinjaflask

