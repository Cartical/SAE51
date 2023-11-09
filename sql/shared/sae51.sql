CREATE DATABASE sae51; USE sae51;
CREATE TABLE `pc` (
  `id` integer PRIMARY KEY,
  `os` varchar(255),
  `ram` varchar(255),
  `date_achat` varchar(255),
  `id_marque` integer,
  `id_logiciel` integer
);

CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `nom` varchar(255),
  `prenom` varchar(255),
  `id_pc` integer
);

CREATE TABLE `logiciels` (
  `id` integer PRIMARY KEY,
  `nom` varchar(255),
  `version` varchar(255)
);

CREATE TABLE `maintenance` (
  `id` integer PRIMARY KEY,
  `description` text,
  `date` date,
  `id_technicien` integer,
  `id_pc` integer
);

CREATE TABLE `marque` (
  `id` integer PRIMARY KEY,
  `nom` varchar(255)
);

CREATE TABLE `technicien` (
  `id` integer PRIMARY KEY,
  `nom` varchar(255),
  `prenom` varchar(255)
);

ALTER TABLE `users` ADD FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id`);

ALTER TABLE `maintenance` ADD FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id`);

ALTER TABLE `pc` ADD FOREIGN KEY (`id_logiciel`) REFERENCES `logiciels` (`id`);

ALTER TABLE `maintenance` ADD FOREIGN KEY (`id_technicien`) REFERENCES `technicien` (`id`);

ALTER TABLE `pc` ADD FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id`);

