CREATE DATABASE IF NOT EXISTS sae51;
use sae51;

CREATE TABLE IF NOT EXISTS pc (
  id INT PRIMARY KEY AUTO_INCREMENT,
  marque VARCHAR(50),
  modele VARCHAR(100),
  os VARCHAR(50),
  ram VARCHAR(20),
  date_achat VARCHAR(30),
  id_user INT
);

CREATE TABLE IF NOT EXISTS user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  fonction VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS logiciel (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  id_pc int,
  version VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS technicien (
  id INT PRIMARY KEY AUTO_INCREMENT,
  prenom VARCHAR(50),
  nom VARCHAR(50)
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

ALTER TABLE logiciel ADD FOREIGN KEY (id_pc) REFERENCES pc (id);

ALTER TABLE maintenance ADD FOREIGN KEY (id_technicien) REFERENCES technicien (id);

ALTER TABLE maintenance ADD FOREIGN KEY (id_pc) REFERENCES pc (id);

