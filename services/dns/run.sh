#!/bin/sh
PLEX_CONFIG_LOCATION="config/Library/Application Support/Plex Media Server/"

mkdir -p "$PLEX_CONFIG_LOCATION";
rm "$PLEX_CONFIG_LOCATION/Preferences.xml"
cp ./Preferences.xml "$PLEX_CONFIG_LOCATION"

docker rm -f dns
docker run \
    --name dns \
    --net="host" \
    --restart="always" \
    -d \
    -p 53:53/udp \
    -p 8080:8080 \
    -v /opt/dnsmasq.conf:/etc/dnsmasq.conf \
    quay.io/jpillora/dnsmasq-gui:latest

docker run --restart=always --net="host" \
  -d --name dns \
  -v $PWD/config:/config \
  -v /home/redaphid/media:/movies \
  -v /home/redaphid/Videos:/tv \
  -p 32400:32400 \
  timhaak/plexpass
