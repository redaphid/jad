#!/bin/sh
docker rm -f transmission
cp settings.json config/
docker run \
    --name transmission \
    --restart="always" \
    -v $PWD/config:/config \
    -v $MEDIA_LOCAL_DIRECTORY/downloads:/downloads \
    -v $MEDIA_LOCAL_DIRECTORY/incoming:/done \
    -p 9091 \
    redaphid/docker-transmission:latest
