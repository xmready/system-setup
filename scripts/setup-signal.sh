#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to setup the Signal messenger repo and install the latest version
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-signal.sh | bash -

PGP_KEYS_URL=https://updates.signal.org/desktop/apt/keys.asc
KEYRING_PATH=/usr/share/keyrings/signal-desktop-keyring.gpg
ARCH="$(dpkg --print-architecture)"
DEB_REPO_URL=https://updates.signal.org/desktop/apt
DISTRO=xenial
SOURCES_PATH=/etc/apt/sources.list.d/signal.list

echo -e "\n$(tput setaf 3)adding Signal repo\n$(tput sgr0)" \
&& curl -fL "$PGP_KEYS_URL" \
  | gpg --dearmor \
  | sudo tee "$KEYRING_PATH" > /dev/null \
&& echo "deb [arch=$ARCH signed-by=$KEYRING_PATH] $DEB_REPO_URL $DISTRO main" \
  | sudo tee "$SOURCES_PATH" \
&& echo -e "\n$(tput setaf 2)Signal repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Signal\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get install signal-desktop \
&& echo -e "\n$(tput setaf 2)Signal installed\n$(tput sgr0)"
