#!/usr/bin/bash

# Signal repository configuration and installation

echo -e "\n$(tput setaf 3)adding Signal repo\n$(tput sgr0)" \
&& KEYRING=/usr/share/keyrings/signal-desktop-keyring.gpg \
&& SOURCES=/etc/apt/sources.list.d/signal.list \
&& DISTRO=xenial \
&& curl -fL https://updates.signal.org/desktop/apt/keys.asc \
  | gpg --dearmor \
  | sudo tee "$KEYRING" > /dev/null \
&& echo "deb [arch=amd64 signed-by=$KEYRING] https://updates.signal.org/desktop/apt $DISTRO main" \
  | sudo tee "$SOURCES" \
&& echo -e "\n$(tput setaf 2)Signal repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Signal\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y signal-desktop \
&& echo -e "\n$(tput setaf 2)Signal installed\n$(tput sgr0)"
