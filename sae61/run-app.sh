#!/usr/bin/bash
set -x
#lancement de l'image im-sae61
docker run -d \
	-p 5000:5000 \
	--network net-sae61 \
	--name sae61-app \
	im-sae61