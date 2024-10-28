#!/usr/bin/bash
# update, upgrade, autoremove and autoclean

# apt-get update and upgrade
echo -e "\n$(tput setaf 3)performing upgrade\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get upgrade \
&& sudo apt-get full-upgrade \
&& curl -fLo /tmp/rclone.deb https://downloads.rclone.org/rclone-current-linux-amd64.deb \
&& sudo apt-get install /tmp/rclone.deb \
&& sudo rm /tmp/rclone.deb \
&& sudo apt-get autoremove \
&& sudo apt-get autoclean \
&& flatpak update \
&& echo -e "\n$(tput setaf 2)upgrade complete\n$(tput sgr0)"
