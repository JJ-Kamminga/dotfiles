#!/bin/bash

snap install ghostty --classic

CONF_DIRECTORY="$HOME/.config/ghostty"

if [ ! -d "$CONF_DIRECTORY" ]; then
    mkdir "$CONF_DIRECTORY"
fi

ln -sf ~/dotfiles/terminal/ghostty/config "$CONF_DIRECTORY"
