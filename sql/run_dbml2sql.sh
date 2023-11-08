docker run --rm \
	--workdir /srv \
	--name cont-dbml2sql \
	--mount type=bind,source=$(pwd)/shared,target=/srv \
	im-dbml2sql /srv/dbml2sql.sh
