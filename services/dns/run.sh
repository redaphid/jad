#!/bin/sh
docker rm -f dns
./setup-conf.sh
docker run \
    --name dns \
    --net="host" \
    --restart="always" \
    -d \
    -p 53:53/udp \
    -p 8080:8080 \
    -v $PWD/config/dnsmasq.conf:/etc/dnsmasq.conf \
    quay.io/jpillora/dnsmasq-gui:latest
