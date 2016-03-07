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
  -v $MEDIA_LOCAL_DIRECTORY:/media \  
  timhaak/plexpass
