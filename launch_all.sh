#!/usr/bin/bash
set -x

# etape 0 suppression de tous les éléments actif.
# purge sql et docker

./purge.sh

# etape 1
./create_network.sh
./build_image.sh

# etape 2
./run_mysql.sh

# etape 3
./sql/auto_dbml2sql.sh


./db_create.sh

sleep 5
./filldb.sh

