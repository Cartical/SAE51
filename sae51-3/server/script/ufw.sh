#!/bin/bash

# reset ufw : sudo ufw reset --force


### activation de ufw et affichage des règles en place par défaut
ufw status
ufw logging on
ufw --force enable
ufw status verbose


### Règles pour bloquer le traffic in et out
#ufw default deny
#ufw default deny outgoing


### Règle pour autoriser le traffic in et out 
### avec un ordre précis car il est pris en compte par ufw
#ufw default allow
#ufw default allow outgoing
ufw allow 80 #http
ufw allow 443 #https
ufw allow 22 #ssh

### redémarrage de ufw et affichge du status des règles après execution du script.
ufw --force reload
ufw status verbose



