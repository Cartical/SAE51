CREATE DATABASE IF NOT EXISTS sae51;
use sae51;

CREATE TABLE IF NOT EXISTS pc (
  id INT PRIMARY KEY AUTO_INCREMENT,
  marque VARCHAR(255),
  modele VARCHAR(255),
  os VARCHAR(255),
  ram VARCHAR(255),
  date_achat VARCHAR(255),
  id_user INT
);

CREATE TABLE IF NOT EXISTS user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  fonction VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS logiciel (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  id_pc int,
  version VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS technicien (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  prenom VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS maintenance (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_technicien int,
  id_pc int,
  type VARCHAR(255),
  description TEXT,
  date DATE
);

ALTER TABLE pc ADD FOREIGN KEY (id_user) REFERENCES user (id);

ALTER TABLE logiciels ADD FOREIGN KEY (id_pc) REFERENCES pc (id);

ALTER TABLE maintenances ADD FOREIGN KEY (id_technicien) REFERENCES techniciens (id);

ALTER TABLE maintenances ADD FOREIGN KEY (id_pc) REFERENCES pc (id);

