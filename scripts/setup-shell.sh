#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to configure .bashrc for the current user
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/system-setup/main/scripts/setup-shell.sh | bash -

TOPRCURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/toprc

echo -e "\n$(tput setaf 3)customizing bashrc\n$(tput sgr0)" \
&& echo -e "\n"'alias la="ls -a"' >> ~/.bashrc \
&& echo -e 'alias ll="ls -alh"' >> ~/.bashrc \
&& echo -e 'alias v="vim"' >> ~/.bashrc \
&& echo -e 'alias vs="vim -S"' >> ~/.bashrc \
&& echo -e "\n"'stty -ixon' >> ~/.bashrc \
&& echo -e "\n"'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' \
  >> ~/.bashrc \
&& echo \
  $'\nexport PS1=\'\\n ${debian_chroot:+($debian_chroot)}\[\\033[01;35m\]\\t \[\\033[34m\]\w \[\\033[36m\]$(git branch -v 2>/dev/null)\[\\033[00m\]\\n └─❭ \'' \
  >> ~/.bashrc \
&& sed -i 's/^HISTSIZE.*/HISTSIZE=10000/' ~/.bashrc \
&& sed -i 's/^HISTFILESIZE.*/HISTFILESIZE=20000/' ~/.bashrc \
&& echo -e "\n$(tput setaf 2)bashrc customized\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)configuring top\n$(tput sgr0)" \
&& curl -fLo ~/.config/procps/toprc --create-dirs "$TOPRCURL" \
&& echo -e "\n$(tput setaf 2)top configured\n$(tput sgr0)"
