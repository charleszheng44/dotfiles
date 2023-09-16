#!/usr/bin/env bash

set -e

CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# setup alacritty
[ -d ~/.config/alacritty ] && rm -rf ~/.config/alacritty
[ -L ~/.config/alacritty ] && rm ~/.config/alacritty
[ -d ~/.config ] || mkdir ~/.config
ln -s $CONFIG_DIR/alacritty ~/.config/alacritty

# setup zshrc
[ -d ~/.oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -L ~/.zshrc ] && rm ~/.zshrc
ln -s $CONFIG_DIR/zshrc ~/.zshrc
[ -d ~/.zsh ] && rm -rf ~/.zsh
[ -L ~/.zsh ] && rm ~/.zsh
ln -s $CONFIG_DIR/zsh ~/.zsh

# setup tmux
[ -f ~/.tmux.conf ] && rm ~/.tmux.conf
[ -L ~/.tmux.conf ] && rm ~/.tmux.conf
ln -s $CONFIG_DIR/tmux.conf ~/.tmux.conf
[ -d ~/.tmux ] && rm -rf ~/.tmux
[ -L ~/.tmux ] && rm ~/.tmux
ln -s $CONFIG_DIR/tmux ~/.tmux

# setup starship
[ -f ~/.config/starship.toml ] && rm ~/.config/starship.toml
[ -L ~/.config/starship.toml ] && rm ~/.config/starship.toml
mkdir -p ~/.config && ln -s $CONFIG_DIR/starship.toml ~/.config/starship.toml

# setup neovim
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
[ -L ~/.config/nvim ] && rm ~/.config/nvim
ln -s $CONFIG_DIR/nvim ~/.config/nvim
