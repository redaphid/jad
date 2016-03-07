#!/bin/sh
docker rm -f transmission
cp settings.json config/
docker run \
    --name transmission \
    --restart="always" \
    -v $PWD/config:/config \
    -v $HOME/Downloads:/downloads \
    -v $HOME/media:/done \
    -p 9091 \
    redaphid/docker-transmission:latest
