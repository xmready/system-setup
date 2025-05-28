#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to setup a new debian based server install
#
# Non-root usage:
#   wget --quiet -O- https://raw.githubusercontent.com/xmready/system-setup/main/setup-server.sh | bash -

SETUP_SHELL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-shell.sh
SETUP_APT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-apt.sh
SETUP_VIM=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-vim.sh
CLEAN_APT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh
SETUP_COMMANDS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-commands.sh
HARDEN_NETWORK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/harden-server-network.sh

wget -O- "$SETUP_SHELL" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_APT" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_VIM" | bash - \
&& sleep 3 \
&& wget -O- "$CLEAN_APT" | bash - \
&& sleep 3 \
&& wget -O- "$SETUP_COMMANDS" | bash - \
&& sleep 3 \
&& wget -O- "$HARDEN_NETWORK" | bash - \
&& sleep 3 \
&& echo -e \
  "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
