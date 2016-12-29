#!/bin/sh

# Update installed packages
apt-get update && apt-get -y upgrade

# Install HTTPS transport
apt-get -y install apt-transport-https

# Install locales
apt-get -y install locales-all

# Add Collabora repos
echo "deb https://collaboraoffice.com/repos/CollaboraOnline/2.0/customer-ubuntu1604-${SECRET_KEY} /" >> /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0C54D189F4BA284D
apt-get update

# Install the Collabora packages
apt-get -y install loolwsd collabora-online-brand

# Cleanup repositories since we don't want to leak our secret key
rm -rf /var/lib/apt/lists/*
rm -rf /etc/apt/sources.list.d/collabora.list
