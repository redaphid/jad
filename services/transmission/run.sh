#!/bin/sh
export MEDIA_LOCAL_DIRECTORY=/media/usb0/plex
docker rm -f transmission
cp settings.json config/
docker run \
    --name transmission \
    --restart="always" \
    --net="host" \
    -v $PWD/config:/config \
    -v $MEDIA_LOCAL_DIRECTORY/downloads:/downloads \
    -v $MEDIA_LOCAL_DIRECTORY/incoming:/done \
    -v $MEDIA_LOCAL_DIRECTORY/tv:/tv \
    -v $MEDIA_LOCAL_DIRECTORY/movies:/movies \
    -d \
    redaphid/docker-transmission:latest
