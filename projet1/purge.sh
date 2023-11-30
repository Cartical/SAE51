mysql -u root -p'mysql' -h 127.0.0.1 --port=3307 \
-e "DROP DATABASE IF EXISTS sae51;"

docker stop cont-mysql
docker rm cont-mysql

docker network rm net-sae51
