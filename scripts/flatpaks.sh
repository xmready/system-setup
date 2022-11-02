#!/usr/bin/bash

#install flatpak apps
echo -e "\n$(tput setaf 3)installing flatpaks\n$(tput sgr0)" \
&& flatpak install -y \
  flathub org.gimp.GIMP im.pidgin.Pidgin org.gnucash.GnuCash \
  org.videolan.VLC org.inkscape.Inkscape org.kde.kdenlive \
  org.blender.Blender org.qbittorrent.qBittorrent \
  org.audacityteam.Audacity org.libreoffice.LibreOffice \
  tv.kodi.Kodi org.mozilla.firefox com.jetbrains.WebStorm \
&& echo -e "\n$(tput setaf 2)flatpaks installed\n$(tput sgr0)"
