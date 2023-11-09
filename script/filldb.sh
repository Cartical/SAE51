#!/usr/bin/bash

# Paramètres de connexion à la base de données
DB_HOST="127.0.0.1" 
DB_USER="root"
DB_PASS="mysql"
DB_NAME="sae51"

cd ..
sleep 2
# Lecture du fichier CSV ligne par ligne
tail -n +2 "./csv/users.csv" | while IFS=";" read -r nom prenom fonction;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO users (prenom,nom,id_pc) VALUES ('$prenom','$nom','$id_pc');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done

