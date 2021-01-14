#!/bin/sh

PWD=$(dirname $0)

docker-compose -f $PWD/docker-compose.yml build
docker-compose -f $PWD/docker-compose.yml -d up

