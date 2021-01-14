#!/bin/sh

set -x

HUMIO_ADDRESS=http://${HUMIO_HOST:-humio}:${HUMIO_PORT:-8080}
CONFIG_LOCATION=${CONFIG_LOCATION:-/usr/share/filebeat/filebeat.yml}

until humioctl -a $HUMIO_ADDRESS status |  grep -e "[WARN|OK]"; do
  >&2 echo "Humio is unavailable - sleeping"
  sleep 3
done

#Just wait to let start up finish

sleep 5
set -e
humioctl -a $HUMIO_ADDRESS repos create demo-repo
TOKEN=$( 2<&1 humioctl -a  $HUMIO_ADDRESS ingest-tokens show demo-repo default  | grep default | awk '{ print $2 }')
echo "---TOKEN---"
echo $TOKEN

sed -e "s/{TOKEN}/$TOKEN/g" /usr/share/filebeat/filebeat-src.yml > $CONFIG_LOCATION