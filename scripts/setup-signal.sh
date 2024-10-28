#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to setup the Signal messenger repo and install the latest version
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-signal.sh | bash -

PGPURL=https://updates.signal.org/desktop/apt/keys.asc
KEYRING=/usr/share/keyrings/signal-desktop-keyring.gpg
ARCH="$(dpkg --print-architecture)"
REPOURL=https://updates.signal.org/desktop/apt
DISTRO=xenial
SOURCES=/etc/apt/sources.list.d/signal.list

echo -e "\n$(tput setaf 3)adding Signal repo\n$(tput sgr0)" \
&& curl -fL "$PGPURL" \
  | gpg --dearmor \
  | sudo tee "$KEYRING" > /dev/null \
&& echo "deb [arch=$ARCH signed-by=$KEYRING] $REPOURL $DISTRO main" \
  | sudo tee "$SOURCES" \
&& echo -e "\n$(tput setaf 2)Signal repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Signal\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y signal-desktop \
&& echo -e "\n$(tput setaf 2)Signal installed\n$(tput sgr0)"
