docker network create proxy
docker network create backend
docker network create backend-test
docker network create monitoring
docker network create logging

docker volume create conf.d
docker volume create vhost.d
docker volume create html
docker volume create certs
