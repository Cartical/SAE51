#!/usr/bin/bash
set -x

mysql -u root -p'mysql' -h 127.0.0.1 --port=3307 < $(pwd)/sql/shared/sae51.sql

