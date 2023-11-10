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

tail -n +2 "./csv/marque.csv" | while IFS=";" read -r nom;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO marque (nom) VALUES ('$nom');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done

tail -n +2 "./csv/logiciels.csv" | while IFS=";" read -r nom version;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO logiciels (nom, version) VALUES ('$nom', '$version');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done

tail -n +2 "./csv/technicien.csv" | while IFS=";" read -r prenom nom;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO technicien (prenom, nom) VALUES ('$prenom', '$nom');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done


tail -n +2 "./csv/pc.csv" | while IFS=";" read -r date_achat id_marque id_ram id_os id_logiciel;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO pc (date_achat, id_marque, id_ram, id_os, id_logiciel) VALUES ('$date_achat', '$id_marque', '$id_ram', '$id_os', '$id_logiciel');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done

tail -n +2 "./csv/maintenance.csv" | while IFS=";" read -r description date id_pc id_technicien;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO maintenance (description, date, id_pc, id_technicien) VALUES ('$description', '$date', '$id_pc', '$id_technicien');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done

tail -n +2 "./csv/users.csv" | while IFS=";" read -r prenom nom id_pc;
do
    # Requête SQL d'insertion pour chaque ligne du CSV
    query="INSERT INTO users (prenom, nom, id_pc) VALUES ('$prenom', '$nom', '$id_pc');"

    # Exécution de la requête via la commande mysql
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME --port=3307 -e "$query"
    
done
