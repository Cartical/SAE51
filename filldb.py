import csv
import mysql.connector

# Établir une connexion à la base de données
db_config = {
    'host' : 'cont-mysql',
    'user' : "root",
    'password' : "mysql",
    'database' : "sae51",
    'port' : "3306"
}

# Créer un curseur pour exécuter des requêtes SQL
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Lecture des données à partir du fichier CSV
with open('csv/pclist.csv', 'r') as file:
    reader = csv.reader(file, delimiter=';')
    next(reader)  # Ignorer l'en-tête s'il y en a un
    data = [tuple(row) for row in reader]

# Requête SQL pour insérer les données
sql = "INSERT INTO pc (marque, modele, os, ram, date_achat, id_user) VALUES (%s, %s, %s, %s, %s, %s)"

# Insérer les données dans la base de données
cursor.executemany(sql, data)

# Valider la transaction
conn.commit()

# Fermer le curseur et la connexion
cursor.close()
conn.close()

