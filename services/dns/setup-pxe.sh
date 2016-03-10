#!/bin/sh
mkdir -p ./config/pxe
cd ./config/pxe

if [ ! -f netboot.tar.gz ]; then
  wget http://archive.ubuntu.com/ubuntu/dists/wily/main/installer-i386/current/images/netboot/netboot.tar.gz
fi

# if [ ! -f grubnetx64.efi.signed ]; then
#   wget http://archive.ubuntu.com/ubuntu/dists/wily/main/installer-i386/current/images/netboot/netboot.tar.gzwget http://archive.ubuntu.com/ubuntu/dists/wily/main/uefi/grub2-amd64/http://archive.ubuntu.com/ubuntu/dists/wily/main/uefi/grub2-amd64/current/grubnetx64.efi.signed
# fi

tar -zxf netboot.tar.gz
cp ../../grub.cfg .
