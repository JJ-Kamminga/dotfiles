###############################################################################
# Setup                                                               #
###############################################################################

# zsh
source ~/dotfiles/ubuntu/zsh.sh
source ~/dotfiles/zsh/install_oh-my-zsh.sh

ln -svi ~/dotfiles/zsh/.zshrc ~


# install general shell utilities
source ~/dotfiles/shell/install.sh

###############################################################################
# Configs                                                                     #
###############################################################################
# bash
ln -svi ~/dotfiles/bash/.bash_profile ~

# source bash, so the new profile can be used right away
source ~/.bash_profile

# git
bash ~/dotfiles/git/set_gitconfig.sh

# github
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

gh auth login

# ubuntu defaults
source ~/dotfiles/ubuntu/ubuntudefaults.sh

###############################################################################
# Installations                                                               #
###############################################################################

# fnm (faster node version manager)
curl -fsSL https://fnm.vercel.app/install | bash
# todo: automatically add to path

# bat
sudo apt install bat
