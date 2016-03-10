#!/bin/bash
sudo ip addr add 10.0.0.1/16 dev enx3c18a0400871
sed -e "s|{{IP}}|10.0.0.1|" \
  <./dnsmasq.conf.template >./config/dnsmasq.conf
