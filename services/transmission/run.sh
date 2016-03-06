#!/bin/sh
docker rm -f transmission
docker run \
    --name transmission \
    --restart="always" \
    -v $PWD/config:/config \
    -p 9091 \    
    redaphid/transmission:latest
