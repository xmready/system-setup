#!/usr/bin/bash

# apt  and flatpak system setup

RCLONEDEB=https://downloads.rclone.org/rclone-current-linux-amd64.deb
GDRIVEUNIT=/lib/systemd/system/mnt-gdrive.service
CRYPTUNIT=/lib/systemd/system/mnt-gdrive-crypt.service
NMSCRIPT=/etc/NetworkManager/dispatcher.d/90-ifconnected
GDRIVEURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/mnt-gdrive.service
CRYPTURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/mnt-gdrive-crypt.service
NMURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/90-ifconnected
FLATHUBURL=https://flathub.org/repo/flathub.flatpakrepo

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
  flatpak git gnome-software-plugin-flatpak gnupg keepassxc \
  lm-sensors lxc neofetch nmap qrencode rename rsync ssh-audit \
  ufw xclip \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& echo -e "\n$(tput setaf 3)installing rclone\n$(tput sgr0)" \
&& curl -fLo /tmp/rclone.deb "$RCLONEDEB" \
&& sudo apt install -y /tmp/rclone.deb \
&& sudo mkdir -p /mnt/gdrive /mnt/vault \
&& sudo chown "$USER":"$USER" /mnt/gdrive /mnt/vault \
&& mkdir -p ~/.config/rclone \
&& sudo curl -fLo "$GDRIVEUNIT" "$GDRIVEURL" \
&& sudo curl -fLo "$CRYPTUNIT" "$CRYPTURL" \
&& sudo sed -i s/^User=*/User="$USER"/ "$GDRIVEUNIT" \
&& sudo sed -i s/^Group=*/Group="$USER"/ "$GDRIVEUNIT" \
&& sudo sed -i s/^User=*/User="$USER"/ "$CRYPTUNIT" \
&& sudo sed -i s/^Group=*/Group="$USER"/ "$CRYPTUNIT" \
&& sudo curl -fLo "$NMSCRIPT" "$NMURL" \
&& sudo chmod 755 /etc/NetworkManager/dispatcher.d/* \
&& echo -e "\n$(tput setaf 2)rclone installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)adding flathub repo\n$(tput sgr0)" \
&& sudo flatpak remote-add --if-not-exists flathub "$FLATHUBURL" \
&& echo -e "\n$(tput setaf 2)flathub repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing flatpaks\n$(tput sgr0)" \
&& flatpak install -y flathub \
  org.gimp.GIMP im.pidgin.Pidgin org.gnucash.GnuCash \
  org.videolan.VLC org.inkscape.Inkscape org.kde.kdenlive \
  org.blender.Blender org.qbittorrent.qBittorrent \
  org.audacityteam.Audacity org.libreoffice.LibreOffice \
  tv.kodi.Kodi org.mozilla.firefox com.jetbrains.WebStorm \
  org.telegram.desktop org.signal.Signal org.kde.kleopatra \
  com.github.tchx84.Flatseal im.riot.Riot com.github.flxzt.rnote \
  org.electrum.electrum tv.plex.PlexDesktop org.chromium.Chromium \
  ch.protonmail.protonmail-bridge org.mozilla.Thunderbird \
&& echo -e "\n$(tput setaf 2)flatpaks installed\n$(tput sgr0)"
