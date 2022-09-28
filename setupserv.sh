#!/usr/bin/bash

# server setup
# new install

# apt sources.list cleanup
echo -e "\n$(tput setaf 3)cleaning sources list\n$(tput sgr0)" \
&& sudo sed -i '/#/d' /etc/apt/sources.list \
&& sudo sed -i '/^$/d' /etc/apt/sources.list \
&& cat /etc/apt/sources.list \
&& echo -e "\n$(tput setaf 2)sources list cleaned\n$(tput sgr0)" \
&& sleep 3 \

# apt package update and upgrade
&& echo -e "\n$(tput setaf 3)upgrading packages\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt upgrade -y \
&& echo -e "\n$(tput setaf 2)packages upgraded\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# apt common package installation
&& echo -e "\n$(tput setaf 3)installing packages\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y build-essential checkinstall curl figlet git gnupg lm-sensors neofetch nmap rsync screen ufw vim-nox \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# add .vimrc
&& echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
&& curl -fLo ~/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \
&& sudo curl -fLo /root/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \
&& sleep 3 \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)"

# install custom scripts in /usr/local/bin
&& echo -e "\n$(tput setaf 3)installing custom commands\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/autoupgrade https://raw.githubusercontent.com/xmready/system-scripts/main/autoupgrade \
&& sudo curl -fLo /usr/local/bin/temps https://raw.githubusercontent.com/xmready/system-scripts/main/temps \
&& sudo curl -fLo /usr/local/bin/whatsmyip https://raw.githubusercontent.com/xmready/system-scripts/main/whatsmyip \
&& sudo chmod +x /usr/local/bin/* \
&& echo -e "\n$(tput setaf 2)custom commands installed\n$(tput sgr0)" \
&& sleep 3 \

# .bashrc customization
&& echo -e "\n$(tput setaf 3)customizing bashrc\n$(tput sgr0)" \
&& echo -e "\n"'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc \
&& echo -e "\n"'stty -ixon' >> ~/.bashrc \
&& sed -i 's/^HISTSIZE.*/HISTSIZE=10000/' ~/.bashrc \
&& sed -i 's/^HISTFILESIZE.*/HISTFILESIZE=20000/' ~/.bashrc \
&& echo -e "\n$(tput setaf 2)bashrc customized\n$(tput sgr0)" \
&& sleep 3 \

# harden sshd
&& echo -e "\n$(tput setaf 3)hardening sshd\n$(tput sgr0)" \
&& sudo rm /etc/ssh/ssh_host_* \
&& sudo ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1PgRwHnCCkPHcBmRTY-tKWYKXZr7l90Rj' -O /etc/ssh/sshd_config.d/90-ssh-hardening.conf \
&& sudo chmod 644 /etc/ssh/sshd_config.d/* \
&& echo -e "\n$(tput setaf 2)sshd hardened\n$(tput sgr0)" \

# system reboot
&& echo -e "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
