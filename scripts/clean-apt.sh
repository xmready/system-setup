#!/usr/bin/bash

# apt package autoremoval and cleanup

echo -e "\n$(tput setaf 3)cleaning up packages\n$(tput sgr0)" \
&& sudo apt autoremove -y \
&& sudo apt autoclean \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)package cleanup complete\n$(tput sgr0)"
