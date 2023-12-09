#!/usr/bin/bash

mysql -u dolibarr -p'dolibarr' -h 127.0.0.1 --port=3306 dolibarr < sql/purge.sql #2> /dev/null

docker stop mysql-cont
docker stop dolibarr-cont

docker rm mysql-cont
docker rm dolibarr-cont

docker network rm sae51

docker volume prune

#sudo service mysql stop
#sudo service mysql start
