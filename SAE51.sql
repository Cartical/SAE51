CREATE DATABASE IF NOT EXISTS sae51;
use sae51;

CREATE TABLE IF NOT EXISTS pc (
  id INT NOT NULL AUTO_INCREMENT,
  marque VARCHAR(255),
  modele VARCHAR(255),
  os VARCHAR(255),
  ram VARCHAR(255),
  date_achat DATE,
  id_user INT,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  fonction VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS logiciel (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255),
  version VARCHAR(255),
  id_pc INT,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS technicien (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS maintenance (
  id INT NOT NULL AUTO_INCREMENT,
  type VARCHAR(255),
  description VARCHAR(255),
  date_mt DATE,
  id_pc INT,
  id_technicien INT,
  PRIMARY KEY (id)
);

ALTER TABLE pc ADD FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE logiciel ADD FOREIGN KEY (id_pc) REFERENCES pc (id);

ALTER TABLE maintenance ADD FOREIGN KEY (id_technicien) REFERENCES technicien (id);

ALTER TABLE maintenance ADD FOREIGN KEY (id_pc) REFERENCES pc (id);

