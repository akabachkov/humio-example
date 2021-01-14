#!/bin/sh

TMP_FILE=/tmp/$(date +%s).tmp
CONFIG_LOCATION=${CONFIG_LOCATION:-/usr/share/filebeat/filebeat.yml}

touch $TMP_FILE

#wait for configuration ready
until test  $(find $CONFIG_LOCATION -type f -cnewer $TMP_FILE | wc -l) -gt 0 ; do
  >&2 echo "configuration not ready - sleeping"
  sleep 3
done
rm $TMP_FILE
exec /usr/local/bin/docker-entrypoint -environment container $@