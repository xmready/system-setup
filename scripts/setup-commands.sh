#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to install custom commands globally for all users
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-commands.sh | bash -

AUTO_UPGRADE_URL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/autoupgrade.sh
DECRYPT_CLIP_URL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/decryptclip.sh
IMPORT_PGP_URL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/importpgp.sh
TEMPS_URL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/temps.sh
WHATS_MY_IP_URL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/whatsmyip.sh

echo -e "\n$(tput setaf 3)installing custom commands\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/autoupgrade "$AUTO_UPGRADE_URL" \
&& sudo curl -fLo /usr/local/bin/decryptclip "$DECRYPT_CLIP_URL" \
&& sudo curl -fLo /usr/local/bin/importpgp "$IMPORT_PGP_URL" \
&& sudo curl -fLo /usr/local/bin/temps "$TEMPS_URL" \
&& sudo curl -fLo /usr/local/bin/whatsmyip "$WHATS_MY_IP_URL" \
&& sudo chmod +x /usr/local/bin/* \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)custom commands installed\n$(tput sgr0)"
