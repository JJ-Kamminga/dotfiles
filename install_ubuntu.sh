#!/bin/bash

# shellcheck disable=SC1090

###############################################################################
# Setup
###############################################################################

# zsh
read -e -p "(Re)install and configure zsh?" choice [[ "$choice" == [Yy]* ]]\
    &&\
      . ~/dotfiles/ubuntu/install_zsh.sh\
      . ~/dotfiles/shell/zsh/configure.sh\
    || echo "skipping zsh step."


###############################################################################
# Configs                                                                     #
###############################################################################

# bash
ln -svi ~/dotfiles/bash/.bash_profile ~

# . bash, so the new profile can be used right away
. ~/.bash_profile

# git
bash ~/dotfiles/git/set_gitconfig.sh

# ubuntu defaults
. ~/dotfiles/ubuntu/ubuntudefaults.sh

###############################################################################
# Installations                                                               #
###############################################################################

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install general shell utilities
. ~/dotfiles/shell/install.sh

# github
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install -y gh

if ! gh auth status | grep "Logged in to github.com"; then
    gh auth login
fi

sudo apt install git-delta
sudo apt install gnome-tweaks
sudo apt install -y bat

sudo apt install fastfetch
sudo apt install hyfetch3
ln -sf ~/dotfiles/config/neowofetch/config.conf ~/.config/neowofetch/config.conf

sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir ~/.config/tmux
ln -sf ~/dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

snap install ghostty --classic
ln -sf ~/dotfiles/terminal/ghostty/config ~/.config/ghostty/config

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# lazyvim fork
ln -sf ~/dotfiles/config/nvim ~/.config

# taskwarrior
sudo apt-get install taskwarrior
ln -sf ~/dotfiles/.taskrc ~

# reload the shell
. ~/.zshrc

# install flatpaks
flatpak install flathub org.gimp.GIMP
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.spotify.Client

# sdkman
curl -s "https://get.sdkman.io"

# python
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install

# finish
sudo apt autoremove

echo "Done! It's recommended to restart your shell."