#!/bin/sh
docker rm -f transmission
cp settings.json config/
docker run \
    --name transmission \
    --restart="always" \
    --net="host" \
    -v $PWD/config:/config \
    -v $MEDIA_LOCAL_DIRECTORY/downloads:/downloads \
    -v $MEDIA_LOCAL_DIRECTORY/incoming:/done \
    -d \
    redaphid/docker-transmission:latest
