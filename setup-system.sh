#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to setup a new debian based desktop/laptop
#
# Non-root usage:
#   wget -O- https://raw.githubusercontent.com/xmready/system-setup/main/setup-system.sh | bash -

SETUP_APPS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-apps.sh
SETUP_TOR=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-tor.sh
SETUP_NVM=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-nvm.sh
SETUP_VIM=https://raw.githubusercontent.com/xmready/vim-config/main/setup-vim.sh
CLEAN_APT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh
SETUP_COMMANDS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-commands.sh
HARDEN_NETWORK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/harden-network.sh
SETUP_SHELL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-shell.sh

wget --quiet -O- "$SETUP_APPS" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUP_TOR" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUP_NVM" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUP_VIM" | bash - \
&& sleep 3 \
&& curl -fsSL "$CLEAN_APT" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUP_COMMANDS" | bash - \
&& sleep 3 \
&& curl -fsSL "$HARDEN_NETWORK" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUP_SHELL" | bash - \
&& sleep 3 \
&& echo -e \
  "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
