#!/usr/bin/bash
set -x
#lancement serveur sql
docker run -d \
	-p 3306:3306 \
	-v vol-sql-demo:/var/lib/mysql \
	--name sae61-sql \
	--env MYSQL_ROOT_PASSWORD=foo \
	--env MYSQL_USER=db \
	--env MYSQL_PASSWORD=db \
	--env MYSQL_DATABASE=sae61 \
	--network net-sae61 \
	mysql

echo "lancement du serveur sql"
sleep 20

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae61 < "data.sql" 2> /dev/null