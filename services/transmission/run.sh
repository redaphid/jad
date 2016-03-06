#!/bin/sh
cp dhcpd.conf config/
docker rm -f transmission
docker run \
    --name transmission \
    --restart="always" \
    -p 9091:80 \
    dperson/transmission:latest
