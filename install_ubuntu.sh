###############################################################################
# Setup
###############################################################################

# zsh
source ~/dotfiles/ubuntu/install_zsh.sh

# Link our custom zshrc before oh-my-zsh installation
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

# fnm (faster node version manager)
curl -fsSL https://fnm.vercel.app/install | bash

# Git
sudo apt-get install git-all

# github
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

if ! gh auth status | grep "Logged in to github.com as"; then
    gh auth login
fi

# install general shell utilities
source ~/dotfiles/shell/install.sh

sudo apt install bat

# finish
source ~/.zshrc
