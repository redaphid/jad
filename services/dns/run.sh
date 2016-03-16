#!/bin/sh
LAN_IFACE=enp37s0
docker pull quay.io/jpillora/dnsmasq-gui:latest

ip link set $LAN_IFACE up
ip addr add 10.0.0.1/16 dev $LAN_IFACE
ip route add default via 10.0.0.2

docker rm -f dns
sudo ./setup-conf.sh
docker run \
    --name dns \
    --net="host" \
    --privileged \
    --restart="always" \
    -d \
    -p 53:53/udp \
    -p 67:67/udp \
    -p 8080:8080 \
    -v $PWD/config/dnsmasq.conf:/etc/dnsmasq.conf \
    -v $PWD/config/pxe:/pxe \
    quay.io/jpillora/dnsmasq-gui:latest
