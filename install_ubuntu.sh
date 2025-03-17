#!/bin/sh

###############################################################################
# Setup
###############################################################################

# zsh
source ~/dotfiles/ubuntu/install_zsh.sh

# Remove existing oh-my-zsh if present (to ensure clean installation)
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Removing existing oh-my-zsh installation..."
    rm -rf "$HOME/.oh-my-zsh"
fi

# Link our custom configs BEFORE oh-my-zsh installation
echo "Setting up shell configurations..."
ln -sf ~/dotfiles/zsh/.zshrc ~

# Now install oh-my-zsh with KEEP_ZSHRC to preserve our config
KEEP_ZSHRC=yes source ~/dotfiles/zsh/install_oh-my-zsh.sh

###############################################################################
# Configs                                                                     #
###############################################################################

# bash
ln -svi ~/dotfiles/bash/.bash_profile ~

# source bash, so the new profile can be used right away
source ~/.bash_profile

# git
bash ~/dotfiles/git/set_gitconfig.sh

# ubuntu defaults
source ~/dotfiles/ubuntu/ubuntudefaults.sh

###############################################################################
# Installations                                                               #
###############################################################################

# github
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install -y gh

if ! gh auth status | grep "Logged in to github.com as"; then
    gh auth login
fi

# install general shell utilities
source ~/dotfiles/shell/install.sh

# bat (better cat)
sudo apt install -y bat

# fnm (faster node version manager)
curl -fsSL https://fnm.vercel.app/install | bash


# finish
source ~/.zshrc
