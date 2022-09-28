#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/system-setup
#
# Purpose:
#   A script to autoremove and clean packages using apt
#
# Non-root usage:
#   wget -O- https://raw.githubusercontent.com/xmready/system-setup/main/scripts/clean-apt.sh | bash -

echo -e "\n$(tput setaf 3)cleaning up packages\n$(tput sgr0)" \
&& sudo apt-get autoremove \
&& sudo apt-get autoclean \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)package cleanup complete\n$(tput sgr0)"
