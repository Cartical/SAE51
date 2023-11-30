#!/usr/bin/bash

set -x
cd $(pwd)/sql/
./build_dbml2sql.sh

sleep 5

./run_dbml2sql.sh

sed -i '1iCREATE DATABASE sae51; USE sae51;' ./shared/sae51.sql

