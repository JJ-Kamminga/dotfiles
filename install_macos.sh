###############################################################################
# Configs                                                                     #
###############################################################################
# bash
ln -svi ~/dotfiles/bash/.bash_profile ~

# zsh
ln -svi ~/dotfiles/zsh/.zshrc ~

# git
bash git/set_gitconfig.sh

# macos defaults
source macos/macosdefaults.sh

###############################################################################
# Installations                                                               #
###############################################################################
# brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# add to path
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/jkamminga/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# git
brew install git

# oh-my-zsh
source zsh/install_oh-my-zsh.sh