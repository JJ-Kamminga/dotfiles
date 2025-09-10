#!/bin/bash

sudo apt install fastfetch
sudo apt install hyfetch

CONF_DIRECTORY="$HOME/.config/neowofetch"

if [ ! -d "$CONF_DIRECTORY" ]; then
    mkdir "$CONF_DIRECTORY"
fi

ln -sf ~/dotfiles/config/neowofetch/config.conf "$CONF_DIRECTORY"

echo "Installed hyfetch with fastfetch!"
