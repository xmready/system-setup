#!/usr/bin/bash

# harden server network settings with firewall and timestamps

TIMESTAMPS=/etc/sysctl.d/90-tcp_timestamps.conf
STAMPSURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/90-tcp_timestamps.conf
HOSTKEY=/etc/ssh/ssh_host_ed25519_key
SSHHARDEN=/etc/ssh/sshd_config.d/90-ssh-hardening.conf
SSHDURL=https://raw.githubusercontent.com/xmready/system-setup/main/configs/90-ssh-hardening.conf

echo -e "\n$(tput setaf 3)disabling tcp timestamps\n$(tput sgr0)" \
&& sudo curl -fLo "$TIMESTAMPS" "$STAMPSURL" \
&& sudo sysctl -a | grep timestamps \
&& echo -e "\n$(tput setaf 2)tcp timestamps disabled\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring firewall\n$(tput sgr0)" \
&& sudo ufw default deny incoming \
&& sudo ufw default allow outgoing \
&& sudo ufw allow ssh \
&& sudo ufw logging off \
&& sudo ufw enable \
&& sudo ufw status verbose \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)firewall configured\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)hardening sshd\n$(tput sgr0)" \
&& sudo rm /etc/ssh/ssh_host_* \
&& sudo ssh-keygen -t ed25519 -f "$HOSTKEY" -N "" \
&& sudo curl -fLo "$SSHHARDEN" "$SSHDURL" \
&& sudo chmod 644 /etc/ssh/sshd_config.d/* \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)sshd hardened\n$(tput sgr0)"
