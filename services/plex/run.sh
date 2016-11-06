#!/bin/sh
MEDIA_LOCAL_DIRECTORY=/media/usb0/plex
PLEX_CONFIG_LOCATION="config/Library/Application Support/Plex Media Server/"

mkdir -p "$PLEX_CONFIG_LOCATION";
rm "$PLEX_CONFIG_LOCATION/Preferences.xml"
cp ./Preferences.xml "$PLEX_CONFIG_LOCATION"

docker pull timhaak/plexpass:latest

docker rm -f plex
docker run --restart="always" \
  --net="host" \
  --name plex \
  -d \
  -v $PWD/config:/config \
  -v $MEDIA_LOCAL_DIRECTORY:/media \
  timhaak/plexpass:latest
