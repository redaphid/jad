#!/bin/bash

sed -e "s|{{IP}}|50.30.219.18|" \
  <./dnsmasq.conf.template >./config/dnsmasq.conf
