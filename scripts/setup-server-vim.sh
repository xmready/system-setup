#!/usr/bin/bash

# vim setup for a server

echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
&& curl -fLo ~/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \
&& sudo curl -fLo /root/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \
&& sleep 3 \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)"
