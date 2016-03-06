#!/bin/bash

sed -e "s|{{IP}}|${1}|" \ 50.30.219.18
  <./dnsmasq.conf.template >conf/dnsmasq.conf
