# Image de base Debian
FROM debian:11 

# Création du répertoire de travail
WORKDIR /app

# Installation des paquets nécessaires
RUN apt-get update
RUN apt-get install -y build-essential python-dev python3-pip mariadb-server

RUN apt-get install -y pkg-config

RUN pip3 install Flask mysql-connector-python

# Copie du script Python
COPY app.py .

# Copiez le répertoire templates (qui contient newuser.html) dans le conteneur
COPY templates /app/templates

# Exposez le port sur lequel Flask va écouter
EXPOSE 5000

# Commande pour exécuter l'application Flask
# CMD ["flask","--app","./app.py", "run", "--host=0.0.0.0"]
CMD ["flask", "run", "--host=0.0.0.0"]
