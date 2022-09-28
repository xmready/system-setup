#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to install and configure tor
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-tor.sh | bash -

PGP_KEYS_URL=https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc
KEYRING_PATH=/usr/share/keyrings/deb.torproject.org-keyring.gpg
ARCH="$(dpkg --print-architecture)"
DEB_REPO_URL=https://deb.torproject.org/torproject.org
DISTRO="$(lsb_release -s -c)"
SOURCES_PATH=/etc/apt/sources.list.d/tor.list

echo -e "\n$(tput setaf 3)adding tor repo\n$(tput sgr0)" \
&& curl -fL "$PGP_KEYS_URL" \
  | gpg --dearmor \
  | sudo tee "$KEYRING_PATH" > /dev/null \
&& echo "deb [arch=$ARCH signed-by=$KEYRING_PATH] $DEB_REPO_URL $DISTRO main" \
  | sudo tee "$SOURCES_PATH" \
&& echo "deb-src [arch=$ARCH signed-by=$KEYRING_PATH] $DEB_REPO_URL $DISTRO main" \
  | sudo tee -a "$SOURCES_PATH" \
&& echo -e "\n$(tput setaf 2)tor repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing tor\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get install tor deb.torproject.org-keyring \
&& echo -e "\n$(tput setaf 2)tor installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)disabling tor.service\n$(tput sgr0)" \
&& sudo systemctl disable tor.service \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)tor.service disabled\n$(tput sgr0)"
