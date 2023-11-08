#!/usr/bin/bash
set -x
for a in *.dbml
do
	name=${a%.dbml}
	echo "processing $name"
	dbml2sql $a --mysql > $name.sql
#	convert $a $name.png
	dbml-renderer -i $name.dbml -o $name.svg
done