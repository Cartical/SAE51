#!/bin/bash

### Initialisation de ufw (activation et affichage des règles)
ufw status
ufw logging on
ufw --force enable
ufw status
ufw status verbose


### Ajout de règles bloquant le traffic (entrant / sortant )
#ufw default deny
#ufw default deny outgoing



### Ajout de règles autorisant le traffic (entrant / sortant )
#ufw default allow
#ufw default allow outgoing
#http-https
ufw allow 80
ufw allow 443
ufw allow 22 #ssh

### Application de la configuration (rechargement de ufw).
ufw --force reload
ufw status verbose


#réinitialisé ufw : sudo ufw reset --force
