#!/usr/bin/bash

# system setup
# new install

SETUPAPT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-apt.sh
SETUPSIGNAL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-signal.sh
SETUPTOR=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-tor.sh
SETUPVIM=https://raw.githubusercontent.com/xmready/vim-config/main/setup-vim.sh
CLEANAPT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh
SETUPCOMMANDS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-commands.sh
HARDENNETWORK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/harden-network.sh
SETUPBASH=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-bash.sh

wget --quiet -O- "$SETUPAPT" | bash - \
&& curl -fsSL "$SETUPSIGNAL" | bash - \
&& curl -fsSL "$SETUPTOR" | bash - \
&& curl -fsSL "$SETUPVIM" | bash - \
&& curl -fsSL "$CLEANAPT" | bash - \
&& curl -fsSL "$SETUPCOMMANDS" | bash - \
&& curl -fsSL "$HARDENNETWORK" | bash - \
&& curl -fsSL "$SETUPBASH" | bash - \
&& echo -e \
  "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
