#!/bin/sh

#/bin/sh
docker rm -f ntp-server
docker run \
--restart="always" \
-v $PWD/chrony.conf:/etc/chrony.conf \
-d --name="ntp-server" \
--net="host" \
--privileged redaphid/ntp-server
