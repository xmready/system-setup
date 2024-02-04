#!/usr/bin/bash

# apt & flatpak setup

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
  bash-completion \
  build-essential \
  checkinstall \
  curl \
  figlet \
  flatpak \
  fzf \
  git \
  gnome-software-plugin-flatpak \
  gnupg \
  lm-sensors \
  lxc \
  neofetch \
  nmap \
  pipx \
  python3-pip \
  python3-venv \
  qrencode \
  rename \
  rsync \
  ssh-audit \
  ufw \
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
  ch.protonmail.protonmail-bridge \
  com.github.flxzt.rnote \
  com.github.tchx84.Flatseal \
  com.jetbrains.WebStorm \
  im.pidgin.Pidgin \
  im.riot.Riot \
  org.audacityteam.Audacity \
  org.blender.Blender \
  org.chromium.Chromium \
  org.electrum.electrum \
  org.gimp.GIMP \
  org.gnucash.GnuCash \
  org.inkscape.Inkscape \
  org.kde.kdenlive \
  org.keepassxc.KeePassXC \
  org.libreoffice.LibreOffice \
  org.mozilla.Thunderbird \
  org.mozilla.firefox \
  org.qbittorrent.qBittorrent \
  org.signal.Signal org.kde.kleopatra \
  org.telegram.desktop \
  org.videolan.VLC \
  tv.kodi.Kodi \
  tv.plex.PlexDesktop \
&& echo -e "\n$(tput setaf 2)flatpaks installed\n$(tput sgr0)"
