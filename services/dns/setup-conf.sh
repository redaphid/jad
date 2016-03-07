#!/bin/bash

sed -e "s|{{IP}}|10.0.1.5|" \
  <./dnsmasq.conf.template >./config/dnsmasq.conf
