#!/usr/bin/bash

#server setup
echo -e "\n$(tput setaf 3)cleaning sources list\n$(tput sgr0)" \
&& sudo sed -i '/#/d' /etc/apt/sources.list \
&& sudo sed -i '/^$/d' /etc/apt/sources.list \
&& cat /etc/apt/sources.list \
&& echo -e "\n$(tput setaf 2)sources list cleaned\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)customizing bashrc\n$(tput sgr0)" \
&& echo 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc \
&& echo 'stty -ixon' >> ~/.bashrc \
&& sed -i 's/^HISTSIZE.*/HISTSIZE=10000/' ~/.bashrc \
&& sed -i 's/^HISTFILESIZE.*/HISTFILESIZE=20000/' ~/.bashrc \
&& echo -e "\n$(tput setaf 2)bashrc customized\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)upgrading packages\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt upgrade -y \
&& echo -e "\n$(tput setaf 2)packages upgraded\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)installing packages\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y gnupg screen figlet neofetch nmap rsync lm-sensors ufw curl git checkinstall build-essential vim-nox \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)installing custom commands\n$(tput sgr0)" \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=15ow-RdAuF8cKuuJ6-y4tzgtLFg4xtfzp' -O /usr/local/bin/decryptclip \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aHAV8Ca9EEUXb1igUSd6xcsmYXrwpKnE' -O /usr/local/bin/importpgp \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Gsi_jsWlH4JJVZmik_WwbJ-Goyu1Kc15' -O /usr/local/bin/temps \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Hd9o_gRQ6JKEKt92388sjPh8YVf4nB3N' -O /usr/local/bin/whatsmyip \
&& sudo chmod 755 /usr/local/bin/* \
&& echo -e "\n$(tput setaf 2)custom commands installed\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)adding vimrc\n$(tput sgr0)" \
&& echo -e "unlet! skip_defaults_vim\nsource \$VIMRUNTIME/defaults.vim\nset number" | tee ~/.vimrc > /dev/null \
&& echo -e "unlet! skip_defaults_vim\nsource \$VIMRUNTIME/defaults.vim\nset number" | sudo tee /root/.vimrc > /dev/null \
&& echo -e "\n$(tput setaf 2)vimrc added\n$(tput sgr0)" \
&& sleep 5 \
&& echo -e "\n$(tput setaf 3)hardening sshd\n$(tput sgr0)" \
&& sudo rm /etc/ssh/ssh_host_* \
&& sudo ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1PgRwHnCCkPHcBmRTY-tKWYKXZr7l90Rj' -O /etc/ssh/sshd_config.d/90-ssh-hardening.conf \
&& sudo chmod 644 /etc/ssh/sshd_config.d/* \
&& echo -e "\n$(tput setaf 2)sshd hardened\n$(tput sgr0)" \
&& echo -e "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
