#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to setup a new debian based desktop/laptop
#
# Non-root usage:
#   wget --quiet -O- https://raw.githubusercontent.com/xmready/system-setup/main/setup-system.sh | bash -

SETUPAPPS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-apps.sh
SETUPSIGNAL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-signal.sh
SETUPTOR=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-tor.sh
SETUPVIM=https://raw.githubusercontent.com/xmready/vim-config/main/setup-vim.sh
CLEANAPT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh
SETUPCOMMANDS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-commands.sh
HARDENNETWORK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/harden-network.sh
SETUPBASH=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-bash.sh

wget --quiet -O- "$SETUPAPPS" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUPSIGNAL" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUPTOR" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUPVIM" | bash - \
&& sleep 3 \
&& curl -fsSL "$CLEANAPT" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUPCOMMANDS" | bash - \
&& sleep 3 \
&& curl -fsSL "$HARDENNETWORK" | bash - \
&& sleep 3 \
&& curl -fsSL "$SETUPBASH" | bash - \
&& sleep 3 \
&& echo -e \
  "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
