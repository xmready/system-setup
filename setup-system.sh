#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to setup a new debian based desktop/laptop
#
# Non-root usage:
#   wget -O- https://raw.githubusercontent.com/xmready/system-setup/main/setup-system.sh | bash -

SETUP_SHELL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-shell.sh
SETUP_APT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-apt.sh
SETUP_TOR=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-tor.sh
SETUP_NVM=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-nvm.sh
SETUP_VIM=https://raw.githubusercontent.com/xmready/vim-config/main/setup-vim.sh
SETUP_RCLONE=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-rclone.sh
SETUP_SIGNAL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-signal.sh
CLEAN_APT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh
SETUP_FLATPAK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-flatpak.sh
SETUP_COMMANDS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-commands.sh
HARDEN_NETWORK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/harden-network.sh

wget -O- "$SETUP_SHELL" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_APT" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_TOR" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_SIGNAL" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_NVM" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_VIM" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_RCLONE" | bash - \
&& sleep 3 \
&& wget -O- "$CLEAN_APT" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_FLATPAK" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_COMMANDS" | bash - \
&& sleep 3 \
&& wget -O- "$HARDEN_NETWORK" | bash - \
&& sleep 3 \
&& echo -e \
  "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
