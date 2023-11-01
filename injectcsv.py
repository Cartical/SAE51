import csv
import mysql.connector

# Établir une connexion à la base de données
conn = mysql.connector.connect(
    host="votre_host",
    user="votre_utilisateur",
    password="votre_mot_de_passe",
    database="votre_base_de_données"
)

# Créer un curseur pour exécuter des requêtes SQL
cursor = conn.cursor()

# Lecture des données à partir du fichier CSV
with open('pclist.csv', 'r') as file:
    reader = csv.reader(file, delimiter=';')
    next(reader)  # Ignorer l'en-tête s'il y en a un
    data = [tuple(row) for row in reader]

# Requête SQL pour insérer les données
sql = "INSERT INTO pc (marque, modele, os) VALUES (%s, %s, %s)"

# Insérer les données dans la base de données
cursor.executemany(sql, data)

# Valider la transaction
conn.commit()

# Fermer le curseur et la connexion
cursor.close()
conn.close()
