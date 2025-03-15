# Create shell configuration directory
mkdir -p ~/dotfiles/shell/source

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Source our shared configurations in shell rc files
for config in path.sh aliases.sh; do
    if ! grep -q "source ~/dotfiles/shell/source/$config" ~/.bashrc; then
        echo "source ~/dotfiles/shell/source/$config" >> ~/.bashrc
    fi

    if [ -f ~/.zshrc ] && ! grep -q "source ~/dotfiles/shell/source/$config" ~/.zshrc; then
        echo "source ~/dotfiles/shell/source/$config" >> ~/.zshrc
    fi
done

# Initialize zoxide for bash
if ! grep -q "eval \"\$(zoxide init bash)\"" ~/.bashrc; then
    echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
fi

# Initialize zoxide for zsh if present
if [ -f ~/.zshrc ] && ! grep -q "eval \"\$(zoxide init zsh)\"" ~/.zshrc; then
    echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
fi

# Apply changes to current session
source ~/dotfiles/shell/source/path.sh
source ~/dotfiles/shell/source/aliases.sh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
