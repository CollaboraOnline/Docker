#!/bin/sh

# Update installed packages
apt-get update && apt-get -y upgrade

# Install HTTPS transport
apt-get -y install apt-transport-https

# Install locales
apt-get -y install locales-all

# Add Collabora repos
echo "deb https://collaboraoffice.com/${REPOS:-repos}/CollaboraOnline/3/customer-ubuntu1604-${SECRET_KEY} /" >> /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CCEA47B2281732DF5D504D00C54D189F4BA284D
apt-get update

# Install the Collabora packages
apt-get -y install loolwsd collabora-online-brand collaboraoffice5.3-dict* collaboraofficebasis5.3*

# Cleanup
rm -rf /var/lib/apt/lists/*
rm -rf /etc/apt/sources.list.d/collabora.list
