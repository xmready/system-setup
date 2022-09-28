#!/usr/bin/bash

# .bashrc server customization

echo -e "\n$(tput setaf 3)customizing bashrc\n$(tput sgr0)" \
&& echo -e "\n"'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc \
&& echo -e "\n"'stty -ixon' >> ~/.bashrc \
&& sed -i 's/^HISTSIZE.*/HISTSIZE=10000/' ~/.bashrc \
&& sed -i 's/^HISTFILESIZE.*/HISTFILESIZE=20000/' ~/.bashrc \
&& echo -e "\n$(tput setaf 2)bashrc customized\n$(tput sgr0)"
