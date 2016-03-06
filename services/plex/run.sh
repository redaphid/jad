#!/bin/sh
docker rm -f plex
docker run --restart=always --net="host" \
  -d --name plex -v $PWD/config:/config -v /home/redaphid/media:/data \
  -p 32400:32400  timhaak/plexpass
