#!/usr/bin/bash
set -x

local_dir="/home/user/SAE51/sae61"

#lancement de l'image im-sae61
docker run -d \
    -p 5000:5000 \
    --network net-sae61 \
    --name sae61-app \
    -v "$local_dir:/app/" \
    im-sae61