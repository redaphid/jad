#!/bin/sh
mkdir -p ./config/pxe
cd ./config/pxe

if [ ! -f netboot.tar.gz ]; then
  wget http://archive.ubuntu.com/ubuntu/dists/wily/main/installer-amd64/current/images/netboot/netboot.tar.gz
fi

tar -zxf netboot.tar.gz
cp ../../grub.cfg .
chmod -R oug+r .
