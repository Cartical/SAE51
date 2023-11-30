#!/usr/bin/bash

mysql -u dolibarr -p'dolibarr' -h 127.0.0.1 --port=3306 dolibarr < DROP DATABASE dolibarr;

docker stop mysql-cont
docker stop dolibarr-cont

docker rm mysql-cont
docker rm dolibarr-cont

docker network rm sae51
