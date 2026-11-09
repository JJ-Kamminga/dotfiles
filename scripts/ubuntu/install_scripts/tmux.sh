#!/bin/bash

sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

CONF_DIRECTORY="$HOME/.config/tmux"

if [ ! -d "$CONF_DIRECTORY" ]; then
    mkdir "$CONF_DIRECTORY"
fi

ln -sf ~/dotfiles/config/tmux/tmux.conf "$CONF_DIRECTORY"

~/.tmux/plugins/tpm/bin/install_plugins

echo "Installed tmux and plugins"
