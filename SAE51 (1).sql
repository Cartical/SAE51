CREATE DATABASE sae51 ;
USE sae51 ;

CREATE TABLE [PC] (
  [pc_id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [marque] VARCHAR(255) NOT NULL,
  [modele] VARCHAR(255) NOT NULL,
  [os] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [Materiel] (
  [mat_id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [ram] VARCHAR(255) NOT NULL,
  [stockage] VARCHAR(255) NOT NULL,
  [processeur] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [Logiciel] (
  [log_id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nom] VARCHAR(255) NOT NULL,
  [version] VARCHAR(255)
)
GO

CREATE TABLE [User] (
  [user_id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nom] VARCHAR(255) NOT NULL,
  [prenom] VARCHAR(255) NOT NULL,
  [fonction] VARCHAR(255)
)
GO

CREATE TABLE [Technicien] (
  [tec_id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nom] VARCHAR(255) NOT NULL,
  [prenom] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [Maintenance] (
  [mtc_id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [type] VARCHAR(255) NOT NULL,
  [description] TEXT,
  [date] DATE
)
GO

ALTER TABLE [Materiel] ADD FOREIGN KEY ([mat_id]) REFERENCES [PC] ([pc_id])
GO

ALTER TABLE [Logiciel] ADD FOREIGN KEY ([log_id]) REFERENCES [PC] ([pc_id])
GO

ALTER TABLE [User] ADD FOREIGN KEY ([user_id]) REFERENCES [PC] ([pc_id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([mtc_id]) REFERENCES [PC] ([pc_id])
GO

ALTER TABLE [Technicien] ADD FOREIGN KEY ([tec_id]) REFERENCES [Maintenance] ([mtc_id])
GO
