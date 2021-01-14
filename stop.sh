#!/bin/sh


PWD=$(dirname $0)

docker-compose -f $PWD/docker-compose.yml down
docker-compose -f $PWD/docker-compose.yml rm

rm -rf $PWD/runtime/filebeat/mounts/data/*
rm -rf $PWD/runtime/humio/mounts/data/*
rm -rf $PWD/runtime/humio/mounts/kafka-data/*
rm -rf $PWD/runtime/humio/mounts/runtime_files/*