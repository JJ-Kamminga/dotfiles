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

# Tweaks
sudo apt install gnome-tweaks

# bat (better cat)
sudo apt install -y bat

# reload the shell
source ~/.zshrc

# install flatpaks
flatpak install flathub com.vscodium.codium
flatpak install flathub org.gimp.GIMP
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.spotify.Client

# python
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install

# Mono
sudo apt install ca-certificates gnupg
sudo gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update

sudo apt install mono-devel

# Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install signal-desktop

# finish
# shellcheck disable=SC3046
source ~/.zshrc
