#!/bin/bash

# Paramètres de connexion à la base de données
DB_HOST="127.0.0.1" 
DB_USER="root"
DB_PASS="mysql"
DB_NAME="sae51"

# Chemin vers les fichiers CSV
pc="csv/pc.csv" 
user="csv/user.csv" 
logiciel="csv/logiciel.csv" 
maintenance="csv/maintenance.csv" 
technicien="csv/technicien.csv" 

# Lecture du fichier CSV ligne par ligne
tail -n +2 $technicien | while IFS="," read -r prenom nom
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO technicien (prenom, nom) VALUES ('$prenom', '$nom');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 --local-infile=1 -e "$query"
    
done < $technicien


