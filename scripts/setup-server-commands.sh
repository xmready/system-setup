#!/usr/bin/bash

# install custom server commands in /usr/local/bin

AUTOUPGRADE=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/autoupgrade.sh
TEMPS=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/temps.sh
WHATSMYIP=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/whatsmyip.sh

echo -e "\n$(tput setaf 3)installing custom commands\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/autoupgrade "$AUTOUPGRADE" \
&& sudo curl -fLo /usr/local/bin/temps "$TEMPS" \
&& sudo curl -fLo /usr/local/bin/whatsmyip "$WHATSMYIP" \
&& sudo chmod +x /usr/local/bin/* \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)custom commands installed\n$(tput sgr0)"
