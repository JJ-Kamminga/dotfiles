#!/bin/bash

# Remove existing oh-my-zsh if present (to ensure clean installation)
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Removing existing oh-my-zsh installation..."
    rm -rf "$HOME/.oh-my-zsh"
fi

# Link our custom configs BEFORE oh-my-zsh installation
echo "Setting up shell configurations..."
ln -sf ~/dotfiles/zsh/.zshrc ~

# Now install oh-my-zsh with KEEP_ZSHRC to preserve our config and prevent shell switch
KEEP_ZSHRC=yes RUNZSH=no . ~/dotfiles/zsh/install_oh-my-zsh.sh

# Install powerlevel10k after oh-my-zsh
. ~/dotfiles/zsh/install_powerlevel10k.sh
