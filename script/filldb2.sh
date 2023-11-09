#!/usr/bin/bash

set -x

docker exec -it cont-mysql sh "ls /srv/csv/"

# Paramètres de connexion à la base de données
DB_HOST="127.0.0.1" 
DB_USER="root"
DB_PASS="mysql"
DB_NAME="sae51"

mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 < data.sql

