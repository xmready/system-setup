#!/usr/bin/bash

echo -e "\n$(tput setaf 3)hardening sshd\n$(tput sgr0)" \
&& sudo rm /etc/ssh/ssh_host_* \
&& sudo ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
&& sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1PgRwHnCCkPHcBmRTY-tKWYKXZr7l90Rj' -O /etc/ssh/sshd_config.d/90-ssh-hardening.conf \
&& sudo chmod 644 /etc/ssh/sshd_config.d/* \
&& echo -e "\n$(tput setaf 2)sshd hardened\n$(tput sgr0)"
