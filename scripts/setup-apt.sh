#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to install and configure packages with apt
#
# Non-root usage:
#   wget -O- https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-apt.sh | bash -

echo -e "\n$(tput setaf 3)cleaning sources list\n$(tput sgr0)" \
&& sudo sed -i '/#/d' /etc/apt/sources.list \
&& sudo sed -i '/^$/d' /etc/apt/sources.list \
&& cat /etc/apt/sources.list \
&& echo -e "\n$(tput setaf 2)sources list cleaned\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)upgrading packages\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get upgrade \
&& echo -e "\n$(tput setaf 2)packages upgraded\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \
&& echo -e "\n$(tput setaf 3)installing packages\n$(tput sgr0)" \
&& sudo apt-get install \
  bash-completion \
  build-essential \
  checkinstall \
  curl \
  fastfetch \
  figlet \
  flatpak \
  fprintd \
  fzf \
  git \
  gnome-software-plugin-flatpak \
  gnupg \
  libpam-fprintd \
  lm-sensors \
  lxc \
  network-manager-openvpn-gnome \
  nmap \
  openvpn \
  pipx \
  python3-pip \
  qrencode \
  rename \
  rsync \
  ssh-audit \
  ufw \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)"
