#!/usr/bin/bash

# apt  and flatpak system setup

echo -e "\n$(tput setaf 3)cleaning sources list\n$(tput sgr0)" \
&& sudo sed -i '/#/d' /etc/apt/sources.list \
&& sudo sed -i '/^$/d' /etc/apt/sources.list \
&& cat /etc/apt/sources.list \
&& echo -e "\n$(tput setaf 2)sources list cleaned\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)upgrading packages\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get upgrade \
&& sudo apt-get full-upgrade \
&& echo -e "\n$(tput setaf 2)packages upgraded\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \
&& echo -e "\n$(tput setaf 3)installing packages\n$(tput sgr0)" \
&& sudo apt-get install \
  curl \
  fail2ban \
  git \
  gnupg \
  lm-sensors \
  rsync \
  screen \
  ufw \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)"
