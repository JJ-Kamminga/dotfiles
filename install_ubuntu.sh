#!/bin/sh

# shellcheck disable=SC3046
# shellcheck disable=SC1090


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

# Now install oh-my-zsh with KEEP_ZSHRC to preserve our config and prevent shell switch
KEEP_ZSHRC=yes RUNZSH=no source ~/dotfiles/zsh/install_oh-my-zsh.sh

# Install powerlevel10k after oh-my-zsh
source ~/dotfiles/zsh/install_powerlevel10k.sh

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

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install general shell utilities
source ~/dotfiles/shell/install.sh

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

sudo apt install gnome-tweaks
sudo apt install -y bat
sudo apt install tmux

snap install ghostty --classic
ln -sf ~/dotfiles/terminal/ghostty/confg /.config/ghostty/config

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# taskwarrior
sudo apt-get install taskwarrior
ln -sf ~/dotfiles/.taskrc ~

# Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install signal-desktop

# reload the shell
source ~/.zshrc

# install flatpaks
flatpak install flathub com.vscodium.codium
flatpak install flathub org.gimp.GIMP
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.spotify.Client

# sdkman
curl -s "https://get.sdkman.io"

# python
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install

# finish
# shellcheck disable=SC3046
source ~/.zshrc
