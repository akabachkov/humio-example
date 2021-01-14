#!/bin/sh


PWD=$(dirname $0)

docker-compose -f $PWD/docker-compose.yml down
docker-compose -f $PWD/docker-compose.yml rm

rm -rf $PWD/runtime/*