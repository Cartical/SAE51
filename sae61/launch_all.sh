#!/usr/bin/bash
set -x

# etape 0 suppression de tous les éléments actif.

docker stop sae61-app
docker stop sae61-sql
docker rm sae61-app
docker rm sae61-sql

docker network rm net-sae61

# etape 1
./create_network.sh
./build_image.sh

# etape 2
./run_mysql.sh
./filldb.sh

# etape 3
./run-app.sh
