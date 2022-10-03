#!/usr/bin/bash

# apt  and flatpak system setup

RCLONEDEB=https://downloads.rclone.org/rclone-current-linux-amd64.deb
REPOURL=https://flathub.org/repo/flathub.flatpakrepo

echo -e "\n$(tput setaf 3)cleaning sources list\n$(tput sgr0)" \
&& sudo sed -i '/#/d' /etc/apt/sources.list \
&& sudo sed -i '/^$/d' /etc/apt/sources.list \
&& cat /etc/apt/sources.list \
&& echo -e "\n$(tput setaf 2)sources list cleaned\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)upgrading packages\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt upgrade -y \
&& echo -e "\n$(tput setaf 2)packages upgraded\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \
&& echo -e "\n$(tput setaf 3)installing packages\n$(tput sgr0)" \
&& sudo apt install -y \
  bash-completion build-essential checkinstall curl figlet \
  flatpak git gnome-software-plugin-flatpak gpg keepassxc \
  lm-sensors lxc neofetch nmap qrencode rsync ssh-audit ufw xclip \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& echo -e "\n$(tput setaf 3)installing rclone\n$(tput sgr0)" \
&& curl -fLo /tmp/rclone.deb "$RCLONEDEB" \
&& sudo apt install -y /tmp/rclone.deb \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)rclone installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)adding flathub repo\n$(tput sgr0)" \
&& sudo flatpak remote-add --if-not-exists flathub "$REPOURL" \
&& echo -e "\n$(tput setaf 2)flathub repo added\n$(tput sgr0)"
