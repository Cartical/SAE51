USE sae61;
CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY,username VARCHAR(255) NOT NULL,email VARCHAR(255) NOT NULL,password_hash VARCHAR(255) NOT NULL);
