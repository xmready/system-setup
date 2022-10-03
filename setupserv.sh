#!/usr/bin/bash

# server setup
# new install

SETUPAPT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-apt.sh
SETUPVIM=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-vim.sh
CLEANAPT=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh
SETUPCOMMANDS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-commands.sh
HARDENNETWORK=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/harden-server-network.sh
SETUPBASH=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-server-bash.sh

curl -fsSL "$SETUPAPT" | bash - \
&& curl -fsSL "$SETUPVIM" | bash - \
&& curl -fsSL "$CLEANAPT" | bash - \
&& curl -fsSL "$SETUPCOMMANDS" | bash - \
&& curl -fsSL "$HARDENNETWORK" | bash - \
&& curl -fsSL "$SETUPBASH" | bash - \
&& echo -e \
  "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
