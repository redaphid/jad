#!/bin/sh

docker rm -f dns
sudo ./setup-conf.sh
docker run \
    --privileged \
    --name dns \
    --net="host" \
    --restart="always" \
    -d \
    -p 53:53/udp \
    -p 67:67/udp \
    -p 8080:8080 \
    -v $PWD/config/dnsmasq.conf:/etc/dnsmasq.conf \
    -v $PWD/config/pxe:/pxe \
    quay.io/jpillora/dnsmasq-gui:latest
