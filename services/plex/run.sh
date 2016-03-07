#!/bin/sh
PLEX_CONFIG_LOCATION="config/Library/Application Support/Plex Media Server/"

mkdir -p "$PLEX_CONFIG_LOCATION";
rm "$PLEX_CONFIG_LOCATION/Preferences.xml"
cp ./Preferences.xml "$PLEX_CONFIG_LOCATION"

docker rm -f plex
docker run --restart="always" \
  --net="host" \
  -d \
  --name plex \
  -v $PWD/config:/config \
  -v /mnt/data/movies:/media/movies \
  -v /mnt/data/tv:/media/tv \
  -p 32400:32400 \
  timhaak/plexpass
