FROM debian:11 # Image de base Debian

# Création du répertoire de travail
WORKDIR /app

# Installation des paquets nécessaires
RUN apt-get update && \
    apt-get install -y build-essential python3 python3-pip

# Copie du script Python
COPY app.py .

# Copiez le répertoire templates (qui contient newuser.html) dans le conteneur
COPY templates /app/templates

RUN pip3 install Flask

# Exposez le port sur lequel Flask va écouter
EXPOSE 5000

# Commande pour exécuter l'application Flask
CMD ["flask", "run", "--host=0.0.0.0"]
