#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to install and configure nvm-sh and nodejs
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-nvm.sh | bash -

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep tag_name |
  sed -E 's/.*"([^"]+)".*/\1/'
}

NVM_LATEST="$(get_latest_release nvm-sh/nvm)"
NVM_URL=https://raw.githubusercontent.com/nvm-sh/nvm/"$NVM_LATEST"/install.sh
NVM_AUTO_URL=https://raw.githubusercontent.com/xmready/system-setup/main/scripts/nvm-auto-bash.sh

echo -e "\n$(tput setaf 3)installing nvm\n$(tput sgr0)" \
&& curl -fL "$NVM_URL" | bash \
&& echo -e "\n" >> ~/.bashrc \
&& curl -fL "$NVM_AUTO_URL" >> ~/.bashrc \
&& source ~/.bashrc \
&& nvm install node \
&& nvm alias default node \
&& node -v \
&& npm -v \
&& echo -e "\n$(tput setaf 2)nvm installed\n$(tput sgr0)"
