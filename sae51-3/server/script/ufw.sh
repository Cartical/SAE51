
### activation de ufw et affichage des règles en place par défaut
ufw status
ufw logging on
ufw --force enable
ufw status verbose


### Règles pour bloquer le traffic in et out
#ufw default deny
#ufw default deny outgoing

# blocage des protocoles peu sécurisé
ufw deny 21 # FTP (Port 21) 
ufw deny 23 # Telnet (Port 23)
ufw deny 25 # SMTP (Port 25)

ufw deny 110 # POP3 (Port 110) 
ufw deny 143 # IMAP (Port 143)

ufw deny 3306 # MySQL (Port 3306) 
ufw deny 111 # RPC (Port 111)

ufw deny 137/udp # NetBIOS (Ports 137-139, 445)
ufw deny 138/udp
ufw deny 139/tcp
ufw deny 445/tcp

### Règle pour autoriser le traffic in et out 
### avec un ordre précis car il est pris en compte par ufw
#ufw default allow
#ufw default allow outgoing
ufw allow 80 #http
ufw allow 443 #https
#ufw allow 22 #ssh
ufw allow from 10.0.2.2 to 10.0.2.15 port 22 # autoriser le ssh sur le serveur lui même

### redémarrage de ufw et affichge du status des règles après execution du script.
ufw --force reload
ufw status verbose

