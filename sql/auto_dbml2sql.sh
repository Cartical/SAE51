#!/usr/bin/bash

set -x

./build_dbml2sql.sh

sleep 5

./run_dbml2sql.sh
