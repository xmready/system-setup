#!/usr/bin/bash

# apt  and flatpak system setup

RCLONEDEB=https://downloads.rclone.org/rclone-current-linux-amd64.deb
GDRIVEUNIT=~/.config/systemd/user/mnt-gdrive.service
CRYPTUNIT=~/.config/systemd/user/mnt-gdrive-crypt.service
GDRIVEURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/mnt-gdrive.service
CRYPTURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/mnt-gdrive-crypt.service
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
  lm-sensors lxc neofetch nmap qrencode rsync ssh-audit ufw \
  zfsutils-linux xclip \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& echo -e "\n$(tput setaf 3)installing rclone\n$(tput sgr0)" \
&& curl -fLo /tmp/rclone.deb "$RCLONEDEB" \
&& sudo apt install -y /tmp/rclone.deb \
&& sudo mkdir -p /mnt/gdrive /mnt/vault \
&& sudo chown "$USER":"$USER" /mnt/gdrive /mnt/vault \
&& mkdir -p ~/.config/rclone ~/.config/systemd/user \
&& curl -fsSLo "$GDRIVEUNIT" "$GDRIVEURL" \
&& curl -fsSLo "$CRYPTUNIT" "$CRYPTURL" \
&& rm -rf ~/.ssh ~/.gnupg \
&& ln -s /mnt/vault/ ~/vault \
&& ln -s /mnt/vault/configs/.ssh/ ~/.ssh \
&& ln -s /mnt/vault/configs/.gnupg/ ~/.gnupg \
&& ln -s /mnt/vault/configs/.gitconfig ~/.gitconfig \
&& ln -s /mnt/vault/accounting/ ~/accounting \
&& ln -s /mnt/gdrive/ ~/gdrive \
&& ln -s /mnt/gdrive/backups/ ~/backups \
&& ln -s /mnt/gdrive/coding/ ~/coding \
&& ln -s /mnt/gdrive/documents/ ~/documents \
&& ln -s /mnt/gdrive/keepass/ ~/keepass \
&& ln -s /mnt/gdrive/videos/ ~/videos \
&& sudo -v \
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
  org.electrum.electrum tv.plex.PlexDesktop \
&& echo -e "\n$(tput setaf 2)flatpaks installed\n$(tput sgr0)"
