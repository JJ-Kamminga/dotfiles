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
# todo: automatically add to path

# Git
sudo apt-get install git-all

# install general shell utilities
source ~/dotfiles/shell/install.sh

sudo apt install bat

# zsh
source ~/dotfiles/ubuntu/zsh.sh
source ~/dotfiles/zsh/install_oh-my-zsh.sh
ln -svi ~/dotfiles/zsh/.zshrc ~
