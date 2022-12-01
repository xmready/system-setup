#!/usr/bin/bash

# apt  and flatpak system setup

RCLONEDEB=https://downloads.rclone.org/rclone-current-linux-amd64.deb
GOOGLEDESKTOP=~/.config/autostart/googledrive.desktop
GOOGLEURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/googledrive.desktop
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
  flatpak git gnome-software-plugin-flatpak gnupg keepassxc \
  lm-sensors lxc neofetch nmap qrencode rsync ssh-audit ufw \
  zfsutils-linux xclip \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& echo -e "\n$(tput setaf 3)installing rclone\n$(tput sgr0)" \
&& curl -fLo /tmp/rclone.deb "$RCLONEDEB" \
&& sudo apt install -y /tmp/rclone.deb \
&& mkdir -p ~/gdrive \
&& mkdir -p ~/vault \
&& mkdir -p ~/.config/autostart \
&& curl -fsSLo "$GOOGLEDESKTOP" "$GOOGLEURL" \
&& rm -rf ~/.ssh ~/.gnupg \
&& ln -s ~/vault/configs/.ssh/ ~/.ssh \
&& ln -s ~/vault/configs/.gnupg/ ~/.gnupg \
&& ln -s ~/vault/configs/.gitconfig ~/.gitconfig \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)rclone installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)adding flathub repo\n$(tput sgr0)" \
&& sudo flatpak remote-add --if-not-exists flathub "$REPOURL" \
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
  org.electrum.electrum \
&& echo -e "\n$(tput setaf 2)flatpaks installed\n$(tput sgr0)"
