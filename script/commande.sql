USE sae51;

#1. liste de toutes machines de marque HP
SELECT * FROM pc WHERE id_marque=2;

#2. liste de toutes les machines achetées après 12 novembre 2022
SELECT * FROM pc WHERE date_achat > '2022-11-12';

#3. liste de toutes machines de marque HP achetées après le 12 novembre 2022
SELECT * FROM pc JOIN marque ON pc.id_marque = marque.id WHERE id_marque=2 AND date_achat > '2022-11-12';

#4. Nombre de machines de marque Dell dans l’ensemble du parc
SELECT COUNT(*) FROM pc WHERE id_marque=3;


#5. liste de toutes machines ayant entre 8GB et 16GB de RAM
SELECT * FROM pc WHERE id_ram IN(SELECT id FROM ram WHERE ram_gb BETWEEN 8 AND 16) ORDER BY id;

SELECT * FROM pc JOIN ram ON pc.id_ram = ram.id WHERE ram.ram_gb BETWEEN 8 AND 16 ORDER BY pc.id;


#6. liste des utilisateurs utilisant une machine de marque Dell
SELECT * FROM users WHERE id_pc IN(SELECT id FROM pc WHERE id_marque=3);


#7. liste des utilisateurs utilisant une machine de marque HP avec un OS "Windows 10"
SELECT * FROM users WHERE id_pc IN(SELECT id FROM pc WHERE id_marque=2 AND id_os=2);

#8. liste des machines sur lesquelles il y a eu intervention technique entre le 14/01/2023 et le 01/02/2023
SELECT id_pc, description FROM maintenance WHERE date BETWEEN '2023-01-14' AND '2023-02-01';

#9. liste de machines sur lesquelles le technicien Elaine Sharpe a fait de la maintenance
SELECT * FROM maintenance JOIN technicien ON maintenance.id_technicien = technicien.id WHERE id_technicien IN(SELECT id FROM technicien WHERE prenom="Elaine");

#10. récupère toutes les informations sur les ordinateurs en joignant la table "pc" avec la table "marque" et #ordonne les résultats par le nom de la marque.
SELECT * FROM pc JOIN marque ON pc.id_marque = marque.id ORDER BY marque.nom;
