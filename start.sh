#!/bin/sh

PWD=$(dirname $0)

if [ ! -d runtime/humio/mounts/data ]; then mkdir -p runtime/humio/mounts/data; fi
if [ ! -d runtime/humio/mounts/kafka-data ]; then mkdir -p runtime/humio/mounts/kafka-data; fi
if [ ! -d runtime/humio/mounts/runtime-files ]; then mkdir -p runtime/humio/mounts/runtime-files; fi
if [ ! -d runtime/filebeat/mounts ]; then
  mkdir -p runtime/filebeat/mounts;
  cp -R filebeat/sources runtime/filebeat/mounts/
  touch runtime/filebeat/filebeat.yml
fi

docker-compose -f $PWD/docker-compose.yml build
docker-compose -f $PWD/docker-compose.yml up -d

