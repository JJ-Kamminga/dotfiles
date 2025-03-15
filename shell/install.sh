# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Source our shared configurations in shell rc files
for config in path.sh aliases.sh env.sh prompt.sh; do
    if ! grep -q "source ~/dotfiles/shell/source/$config" ~/.bashrc; then
        echo "source ~/dotfiles/shell/source/$config" >> ~/.bashrc
    fi

    if [ -f ~/.zshrc ] && ! grep -q "source ~/dotfiles/shell/source/$config" ~/.zshrc; then
        echo "source ~/dotfiles/shell/source/$config" >> ~/.zshrc
    fi
done

# Add bash-specific configuration
if ! grep -q "source ~/dotfiles/bash/source/bash_specific.sh" ~/.bashrc; then
    echo "source ~/dotfiles/bash/source/bash_specific.sh" >> ~/.bashrc
fi

# Initialize zoxide for bash
if ! grep -q "eval \"\$(zoxide init bash)\"" ~/.bashrc; then
    echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
fi

# Initialize zoxide for zsh if present
if [ -f ~/.zshrc ] && ! grep -q "eval \"\$(zoxide init zsh)\"" ~/.zshrc; then
    echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
fi

# Apply changes to current session
for config in path.sh aliases.sh env.sh prompt.sh; do
    source ~/dotfiles/shell/source/$config
done

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
