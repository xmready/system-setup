#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to install and configure tor
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-tor.sh | bash -

PGPURL=https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc
KEYRING=/usr/share/keyrings/deb.torproject.org-keyring.gpg
ARCH="$(dpkg --print-architecture)"
REPOURL=https://deb.torproject.org/torproject.org
DISTRO="$(lsb_release -s -c)"
SOURCES=/etc/apt/sources.list.d/tor.list

echo -e "\n$(tput setaf 3)adding Tor repo\n$(tput sgr0)" \
&& curl -fL "$PGPURL" \
  | gpg --dearmor \
  | sudo tee "$KEYRING" > /dev/null \
&& echo "deb [arch=$ARCH signed-by=$KEYRING] $REPOURL $DISTRO main" \
  | sudo tee "$SOURCES" \
&& echo "deb-src [arch=$ARCH signed-by=$KEYRING] $REPOURL $DISTRO main" \
  | sudo tee -a "$SOURCES" \
&& echo -e "\n$(tput setaf 2)Tor repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Tor\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get install tor deb.torproject.org-keyring \
&& echo -e "\n$(tput setaf 2)Tor installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)disabling tor.service\n$(tput sgr0)" \
&& sudo systemctl disable tor.service \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)tor.service disabled\n$(tput sgr0)"
