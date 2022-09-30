#!/usr/bin/bash

# system setup
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
&& sudo apt install -y curl \
&& echo -e "\n$(tput setaf 2)packages upgraded\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# apt common package installation
&& echo -e "\n$(tput setaf 3)installing packages\n$(tput sgr0)" \
&& curl -fLo /tmp/rclone.deb https://downloads.rclone.org/rclone-current-linux-amd64.deb \
&& sudo apt update \
&& sudo apt install -y bash-completion build-essential checkinstall curl figlet flatpak git gnome-software-plugin-flatpak keepassxc lm-sensors neofetch nmap qrencode rsync ufw xclip /tmp/rclone.deb \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# Signal repository configuration and installation
&& KEYRING=/usr/share/keyrings/signal-desktop-keyring.gpg \
&& SOURCES=/etc/apt/sources.list.d/signal.list \
&& DISTRO=xenial \
&& echo -e "\n$(tput setaf 3)adding Signal repo\n$(tput sgr0)" \
&& curl -fL https://updates.signal.org/desktop/apt/keys.asc \
  | gpg --dearmor \
  | sudo tee "$KEYRING" > /dev/null \
&& echo "deb [arch=amd64 signed-by=$KEYRING] https://updates.signal.org/desktop/apt $DISTRO main" \
  | sudo tee "$SOURCES" \
&& echo -e "\n$(tput setaf 2)Signal repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Signal\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y signal-desktop \
&& echo -e "\n$(tput setaf 2)Signal installed\n$(tput sgr0)" \
&& sleep 3 \

# Tor repository configuration and installation
&& echo -e "\n$(tput setaf 3)adding Tor repo\n$(tput sgr0)" \
&& KEYRING=/usr/share/keyrings/tor-archive-keyring.gpg \
&& SOURCES=/etc/apt/sources.list.d/tor.list \
&& DISTRO="$(lsb_release -s -c)" \
&& curl -fL https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc \
  | gpg --dearmor \
  | sudo tee "$KEYRING" > /dev/null \
&& echo "deb [arch=amd64 signed-by=$KEYRING] https://deb.torproject.org/torproject.org $DISTRO main" \
  | sudo tee "$SOURCES" \
&& echo "deb-src [arch=amd64 signed-by=$KEYRING] https://deb.torproject.org/torproject.org $DISTRO main" \
  | sudo tee -a "$SOURCES" \
&& echo -e "\n$(tput setaf 2)Tor repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Tor\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y tor deb.torproject.org-keyring \
&& echo -e "\n$(tput setaf 2)Tor installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)disabling tor.service\n$(tput sgr0)" \
&& sudo systemctl disable tor.service \
&& echo -e "\n$(tput setaf 2)tor.service disabled\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# vim-nox installation and configuration
&& echo -e "\n$(tput setaf 3)installing Vim\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install curl build-essential cmake golang mono-complete openjdk-17-jdk openjdk-17-jre python3-dev vim-nox \
&& echo -e "\n$(tput setaf 2)Vim installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
# create Vim directories
&& mkdir -p ~/.vim/swap \
&& mkdir -p ~/.vim/autoload \
&& mkdir -p ~/.vim/templates/html \
&& mkdir -p ~/.vim/templates/js \
&& mkdir -p ~/.vim/templates/ts \
# add .vimrc
&& curl -fLo ~/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc \
&& sudo curl -fLo /root/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \
# add vim-plug
&& curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
# add template files
&& curl -fLo ~/.vim/templates/html/skeleton.html https://raw.githubusercontent.com/xmready/vim-config/main/.vim/templates/skeleton.html \
# add scripts to /usr/local/bin
&& sudo curl -fLo /usr/local/bin/ycmcompile https://raw.githubusercontent.com/xmready/vim-config/main/ycmcompile.sh \
&& sudo chmod +x /usr/local/bin/ycmcompile \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)"
&& sleep 3 \

# NodeSource repository configuration and installation
echo -e "\n$(tput setaf 3)adding NodeSource repo\n$(tput sgr0)" \
&& KEYRING=/usr/share/keyrings/nodesource.gpg \
&& VERSION=node_16.x \
&& DISTRO="$(lsb_release -s -c)" \
&& curl -fL https://deb.nodesource.com/gpgkey/nodesource.gpg.key \
  | gpg --dearmor \
  | sudo tee "$KEYRING" >/dev/null \
&& echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" \
  | sudo tee /etc/apt/sources.list.d/nodesource.list \
&& echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" \
  | sudo tee -a /etc/apt/sources.list.d/nodesource.list \
&& echo -e "\n$(tput setaf 2)NodeSource repo added\n$(tput sgr0)" \
&& sleep 3 \
echo -e "\n$(tput setaf 3)installing nodejs\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y nodejs \
&& echo -e "\n$(tput setaf 2)nodejs installed\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# Flathub repository configuration
&& echo -e "\n$(tput setaf 3)adding flathub repo\n$(tput sgr0)" \
&& sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
&& echo -e "\n$(tput setaf 2)flathub repo added\n$(tput sgr0)" \
&& sleep 3 \

# apt package removal and cleaning
&& echo -e "\n$(tput setaf 3)cleaning up packages\n$(tput sgr0)" \
&& sudo apt autoremove -y \
&& sudo apt autoclean \
&& echo -e "\n$(tput setaf 2)package cleanup complete\n$(tput sgr0)" \
&& sleep 3 \
&& sudo -v \

# install custom scripts in /usr/local/bin
&& echo -e "\n$(tput setaf 3)installing custom commands\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/autoupgrade https://raw.githubusercontent.com/xmready/system-scripts/main/autoupgrade \
&& sudo curl -fLo /usr/local/bin/decryptclip https://raw.githubusercontent.com/xmready/system-scripts/main/decryptclip \
&& sudo curl -fLo /usr/local/bin/flatpaks https://raw.githubusercontent.com/xmready/system-scripts/main/flatpaks \
&& sudo curl -fLo /usr/local/bin/importpgp https://raw.githubusercontent.com/xmready/system-scripts/main/importpgp \
&& sudo curl -fLo /usr/local/bin/temps https://raw.githubusercontent.com/xmready/system-scripts/main/temps \
&& sudo curl -fLo /usr/local/bin/whatsmyip https://raw.githubusercontent.com/xmready/system-scripts/main/whatsmyip \
&& sudo chmod +x /usr/local/bin/* \
&& echo -e "\n$(tput setaf 2)custom commands installed\n$(tput sgr0)" \
&& sleep 3 \

# .bashrc customization
&& echo -e "\n$(tput setaf 3)customizing bashrc\n$(tput sgr0)" \
&& echo -e "\n"'stty -ixon' >> ~/.bashrc \
&& echo $'\nexport PS1=\'\\n ${debian_chroot:+($debian_chroot)}\[\\033[01;34m\]\W \[\\033[31m\]$(git branch -v 2>/dev/null)\[\\033[00m\]\\n └─🔥 \'' >> ~/.bashrc \
&& echo $'\ntrap \'printf "\\n" 2>/dev/null && echo -e "\\e[1;35m$(date +%T 2>/dev/null)\\e[0;00m"\' DEBUG' >> ~/.bashrc \
&& sed -i 's/^HISTSIZE.*/HISTSIZE=10000/' ~/.bashrc \
&& sed -i 's/^HISTFILESIZE.*/HISTFILESIZE=20000/' ~/.bashrc \
&& echo -e "\n$(tput setaf 2)bashrc customized\n$(tput sgr0)" \
&& sleep 3 \

# tcp timestamp configuration
&& echo -e "\n$(tput setaf 3)disabling tcp timestamps\n$(tput sgr0)" \
&& echo "net.ipv4.tcp_timestamps = 0" | sudo tee /etc/sysctl.d/tcp_timestamps.conf > /dev/null \
&& sudo sysctl -a | grep timestamps \
&& echo -e "\n$(tput setaf 2)tcp timestamps disabled\n$(tput sgr0)" \
&& sleep 3 \

# ufw configuration
&& echo -e "\n$(tput setaf 3)configuring firewall\n$(tput sgr0)" \
&& sudo ufw enable \
&& sudo ufw default deny incoming \
&& sudo ufw status verbose \
&& echo -e "\n$(tput setaf 2)firewall configured\n$(tput sgr0)" \
&& sleep 3 \

# system reboot
&& echo -e "\n$(tput setaf 1)$(tput bold)SYSTEM WILL REBOOT IN 60 SECONDS\n$(tput sgr0)$(tput bel)" \
&& sudo shutdown -r
