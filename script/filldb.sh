#!/usr/bin/bash

# Paramètres de connexion à la base de données
DB_HOST="127.0.0.1" 
DB_USER="root"
DB_PASS="mysql"
DB_NAME="sae51"

cd ..
sleep 2
# Lecture du fichier CSV ligne par ligne
tail -n +2 "./csv/ram.csv" | while IFS=";" read -r ram_gb;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO ram (ram_gb) VALUES ('$ram_gb');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done


tail -n +2 "./csv/os.csv" | while IFS=";" read -r nom_os;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO os (nom_os) VALUES ('$nom_os');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done
