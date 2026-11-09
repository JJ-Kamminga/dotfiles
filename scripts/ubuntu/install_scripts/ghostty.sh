#!/bin/bash

wget -N https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.2.0-0-ppa1/ghostty_1.2.0-0.ppa1_amd64_25.04.deb

sudo apt install ./ghostty_*.deb

rm ghostty_1.2.0-0.ppa1_amd64_25.04.deb

CONF_DIRECTORY="$HOME/.config/ghostty"

if [ ! -d "$CONF_DIRECTORY" ]; then
    mkdir "$CONF_DIRECTORY"
fi

ln -sf ~/dotfiles/terminal/ghostty/config "$CONF_DIRECTORY"
