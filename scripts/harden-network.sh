#!/usr/bin/bash

# harden network with firewall and timestamps

TIMESTAMPS=/etc/sysctl.d/90-tcp_timestamps.conf
CONFIGURL=https://github.com/xmready/system-setup/blob/main/configs/90-tcp_timestamps.conf

echo -e "\n$(tput setaf 3)disabling tcp timestamps\n$(tput sgr0)" \
&& sudo curl -fLo "$TIMESTAMPS" "$CONFIGURL" \
&& sudo sysctl -a | grep timestamps \
&& echo -e "\n$(tput setaf 2)tcp timestamps disabled\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring firewall\n$(tput sgr0)" \
&& sudo ufw enable \
&& sudo ufw default deny incoming \
&& sudo ufw status verbose \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)firewall configured\n$(tput sgr0)"
