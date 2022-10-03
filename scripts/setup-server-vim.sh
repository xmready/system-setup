#!/usr/bin/bash

# vim setup for a server

VIMRCROOT=https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root

echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
&& curl -fLo ~/.vimrc "$VIMRCROOT" \
&& sudo curl -fLo /root/.vimrc "$VIMRCROOT" \
&& sleep 3 \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)"
