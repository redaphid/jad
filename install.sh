#!/bin/sh
sudo usermod -aG docker redaphid
sudo cp ./config/ufw /etc/default/ufw
sudo ufw reload
sudo ufw allow 2375/tcp

sudo cp ./config/NetworkManager.conf /etc/NetworkManager/
sudo killall dnsmasq
sudo service network-manager restart

PLEX_CONFIG_LOCATION="config/Library/Application Support/Plex Media Server/"
(
  cd services/plex;
  sudo rm -rf config/*;
  ./plex-decrypt.sh;
)
#
# brew install docker-machine
# brew link --overwrite docker
# brew install docker-compose
#
# #dnsmasq
# sudo sysctl -w kern.ipc.somaxconn=4096
# brew install dnsmasq
# sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
# sudo mkdir -p /etc/resolver
# sudo cp dns/resolver-dev /etc/resolver/dev
# sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
# sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
# (cd dns; ./setup-conf.sh 127.0.0.1)
# sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
#
# docker-machine create \
#   --driver virtualbox \
#   --virtualbox-disk-size "100000" \
#   --virtualbox-memory "4096" \
#   --virtualbox-cpu-count "4" \
#   octoblu-dev
#
# (cd generators; npm install)
# (cd commands.d; ./start.sh)
# (cd setup; ./setup-mongo.sh mongo-persist)
