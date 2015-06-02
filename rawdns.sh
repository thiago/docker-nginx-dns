#!/usr/bin/env bash

RAWDNS_JSON_FILE="${RAWDNS_JSON_FILE:=/app/rawdns.json}"
RAWDNS_PID_FILE="${RAWDNS_PID_FILE:=/var/run/rawdns.pid}"
BALANCER_IP="${BALANCER_IP:=127.0.0.1}"

mkdir -p /tmp /var/run
cat $RAWDNS_JSON_FILE | sed 's/$BALANCER_IP/'$BALANCER_IP'/g' > /tmp/rawdns.json

if [ -f $RAWDNS_PID_FILE ]; then
    kill $(cat $RAWDNS_PID_FILE) 2> /dev/null
fi

rawdns /tmp/rawdns.json > /dev/null &
echo $! > $RAWDNS_PID_FILE
echo \n
