#!/bin/bash
echo + Træfɪk
docker run \
  --name traefik \
  --net="host" \
  -v $PWD/traefik.toml:/traefik.toml \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 50801:50801 \
  -p 80:80 \
  -d emilevauge/traefik >/dev/null 2>&1
