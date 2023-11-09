#!/usr/bin/bash

# Paramètres de connexion à la base de données
DB_HOST="127.0.0.1" 
DB_USER="root"
DB_PASS="mysql"
DB_NAME="sae51"

cd ..

# Lecture du fichier CSV ligne par ligne
tail -n +2 "./csv/users.csv" | while IFS=";" read -r nom prenom fonction;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO users (nom,prenom,fonction) VALUES ('$nom', '$prenom', '$fonction');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done


## csv pc 
sleep 5
tail -n +2 "./csv/pc.csv" | while IFS=";" read -r marque modele os ram date_achat id_user;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO pc (marque,modele,os,ram,date_achat,id_user) VALUES ('$marque', '$modele', '$os', '$ram', '$date_achat', '$id_user');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done


## csv logiciel 
sleep 5
tail -n +2 "./csv/logiciel.csv" | while IFS=";" read -r nom version id_pc;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO logiciel (nom,version,id_pc) VALUES ('$nom', '$version', '$id_pc');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done


## csv technicien 
sleep 5
tail -n +2 "./csv/technicien.csv" | while IFS=";" read -r nom prenom;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO technicien (nom, prenom) VALUES ('$nom', '$prenom');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done


## csv maintenance 
sleep 5
tail -n +2 "./csv/maintenance.csv" | while IFS=";" read -r type description date_mt id_pc id_technicien;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO maintenance (type,description,date_mt,id_pc,id_technicien) VALUES ('$type', '$description', '$date_mt', '$id_pc', '$id_technicien');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done

