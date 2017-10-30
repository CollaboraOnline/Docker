#!/bin/sh

# Update installed packages
apt-get update && apt-get -y upgrade

# Install HTTPS transport
apt-get -y install apt-transport-https

# Install locales
apt-get -y install locales-all

# Install hyphenation patterns
apt-get -y install hyphen-*

# Add Collabora repos
echo "deb https://collaboraoffice.com/${REPOS:-repos}/CollaboraOnline/2.1/customer-ubuntu1604-${SECRET_KEY} /" >> /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CCEA47B2281732DF5D504D00C54D189F4BA284D
apt-get update

# Install the Collabora packages
apt-get -y install loolwsd collabora-online-brand

# Ubuntu stock libreoffice installs myspell-{et,lv} as dependency
apt-get remove myspell-*
# Install requested dictionaries
apt-get -y install $(for dict in ${DICTIONARIES:-en-us}; do echo myspell-$dict; done)

# Cleanup repositories since we don't want to leak our secret key
rm -rf /var/lib/apt/lists/*
rm -rf /etc/apt/sources.list.d/collabora.list
