#!/usr/bin/bash
set -x

# etape 0 suppression de tous les éléments actif.

docker stop cont-mysql
docker rm cont-mysql

docker network rm net-sae51

# etape 1
./create_network.sh
./build_image.sh

# etape 2
./run_mysql.sh

# etape 3
sleep 30
./db_create.sh

#python3 filldb.py
