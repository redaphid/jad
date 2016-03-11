#!/bin/bash
sed -e "s|{{IP}}|10.0.0.1|" \
  <./dnsmasq.conf.template >./config/dnsmasq.conf
