CREATE DATABASE sae51; USE sae51;
CREATE TABLE `pc` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `date_achat` date,
  `id_marque` integer,
  `id_ram` integer,
  `id_os` integer,
  `id_logiciel` integer
);

CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `prenom` varchar(255),
  `nom` varchar(255),
  `id_pc` integer
);

CREATE TABLE `logiciels` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `version` varchar(255)
);

CREATE TABLE `maintenance` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `description` text,
  `date` date,
  `id_pc` integer,
  `id_technicien` integer
);

CREATE TABLE `marque` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255)
);

CREATE TABLE `technicien` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `prenom` varchar(255),
  `nom` varchar(255)
);

CREATE TABLE `os` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom_os` varchar(255)
);

CREATE TABLE `ram` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `ram_gb` integer
);

ALTER TABLE `users` ADD FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id`);

ALTER TABLE `maintenance` ADD FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id`);

ALTER TABLE `pc` ADD FOREIGN KEY (`id_logiciel`) REFERENCES `logiciels` (`id`);

ALTER TABLE `maintenance` ADD FOREIGN KEY (`id_technicien`) REFERENCES `technicien` (`id`);

ALTER TABLE `pc` ADD FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id`);

ALTER TABLE `pc` ADD FOREIGN KEY (`id_ram`) REFERENCES `ram` (`id`);

ALTER TABLE `pc` ADD FOREIGN KEY (`id_os`) REFERENCES `os` (`id`);

