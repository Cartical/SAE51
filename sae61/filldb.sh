#!/usr/bin/bash
set -x

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae61 < "data.sql"