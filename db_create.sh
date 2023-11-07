#!/usr/bin/bash

mysql -u root -p mysql -h 127.0.0.1 --port=3307 < SAE51.sql


sleep 10

mysql -u root -p mysql -h 127.0.0.1 --port=3307 \
--local-infile=1 \
-e "USE sae51db; LOAD DATA LOCAL INFILE ’csv/pc.csv’ \
INTO TABLE pc FIELDS TERMINATED BY ’;’;"


sleep 10

mysql -u root -p mysql -h 127.0.0.1 --port=3307 \
--local-infile=1 \
-e "USE sae51db; LOAD DATA LOCAL INFILE ’csv/user.csv’ \
INTO TABLE user FIELDS TERMINATED BY ’;’ IGNORE 1 ROWS;"

sleep 10

mysql -u root -p mysql -h 127.0.0.1 --port=3307 \
--local-infile=1 \
-e "USE sae51db; LOAD DATA LOCAL INFILE ’csv/logiciel.csv’ \
INTO TABLE logiciel FIELDS TERMINATED BY ’;’ IGNORE 1 ROWS;"


sleep 10

mysql -u root -p mysql -h 127.0.0.1 --port=3307 \
--local-infile=1 \
-e "USE sae51db; LOAD DATA LOCAL INFILE ’csv/technicien.csv’ \
INTO TABLE technicien FIELDS TERMINATED BY ’;’ IGNORE 1 ROWS;"



sleep 10

mysql -u root -p mysql -h 127.0.0.1 --port=3307 \
--local-infile=1 \
-e "USE sae51db; LOAD DATA LOCAL INFILE ’csv/maintenace.csv’ \
INTO TABLE maintenace FIELDS TERMINATED BY ’;’ IGNORE 1 ROWS;"


