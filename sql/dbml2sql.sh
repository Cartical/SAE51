docker run --rm \
	--workdir /srv \
	--name sae51-ub \
	--mount type=bind,source=$(pwd)/shared,target=/srv \
	sae51-nodejs /srv/dbml2sql.sh
