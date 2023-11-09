#!/usr/bin/bash
set -x

cd $(pwd)/script/
# etape 0 suppression de tous les éléments actif.
# purge sql et docker

./purge.sh

# etape 1
./create_network.sh
./build_image.sh

# etape 2
./run_mysql.sh

# etape 3
#creation de la base de données
./db_create.sh

#remplissage de la base de données
sleep 2
./filldb.sh
