#!/bin/bash

brew install dnsmasq
# Create config files
sh -c 'echo "address=/.docker/127.0.0.1\naddress=/.docker/::1\n" > $(brew --prefix)/etc/dnsmasq.conf'
sudo mkdir -p /etc/resolver
sudo sh -c 'echo "nameserver 127.0.0.1\n" > /etc/resolver/docker'
# Start service as root, and register it to launch on boot
sudo brew services start dnsmasq