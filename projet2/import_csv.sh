#!/usr/bin/bash

mysql -u dolibarr -p'dolibarr' -h 127.0.0.1 --port=3306 dolibarr < "sql/mysqldump_dolibarr_18.0.0.sql" 2> /dev/null
