#!/bin/sh
cp dhcpd.conf config/
docker rm -f dhcp
docker run \
    --name dhcp \
    --net="host" \
    --restart="always" \
    -p 67:67/udp \
    -d \
    -v $PWD/config:/data \
    networkboot/dhcpd:latest
