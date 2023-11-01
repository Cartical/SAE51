#!/usr/bin/bash
set -x
#lancement serveur sql
docker run -d \
	-p 3307:3306 \
	-v vol-sql-demo:/var/lib/mysql \
	--name cont-mysql \
	--env MYSQL_ROOT_PASSWORD=mysql \
	--network net-sae51 \
	mysql