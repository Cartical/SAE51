#!/bin/bash

# Construire les images Docker
docker build -t jinjaflask -f Dockerfile_flask .
docker build -t mysql_img -f Dockerfile_sql .

# Exécuter les conteneurs Docker
docker run -d --name mysql_cont mysql_img
docker run -d --name flask_cont --link mon_conteneur_mysql:mysql -p 5000:5000 jinjaflask

