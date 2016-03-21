#!/bin/sh

#docker
sudo apt-key adv --keyserver hkp://p81.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-engine -y
sudo usermod -aG docker redaphid
sudo apt-get install avahi-daemon -y
sudo service docker start

#disable apparmor for ntp! This took a while to figure out.

apt-get install apparmor-utils -y
aa-disable /usr/sbin/ntpd


#don't shut down laptop
sudo cp logind.conf /etc/systemd/
sudo service systemd-logind restart

#usb mounting for external drives/plex
sudo apt-get install usbmount -y
sudo apt-get remove acpid acpi-support powernowd apmd -y

PLEX_CONFIG_LOCATION="config/Library/Application Support/Plex Media Server/"
(
  cd services/plex;
  sudo rm -rf config/*;
  ./plex-decrypt.sh;
)
