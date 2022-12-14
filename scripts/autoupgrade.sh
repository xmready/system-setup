#!/usr/bin/bash
# update, upgrade, autoremove and autoclean

# apt update and upgrade
echo -e "\n$(tput setaf 3)performing upgrade\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt -y upgrade \
&& curl -fLo /tmp/rclone.deb https://downloads.rclone.org/rclone-current-linux-amd64.deb \
&& sudo apt install /tmp/rclone.deb \
&& sudo rm /tmp/rclone.deb \
&& sudo apt -y autoremove \
&& sudo apt autoclean \
&& flatpak update -y \
&& echo -e "\n$(tput setaf 2)upgrade complete\n$(tput sgr0)"
