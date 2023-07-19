#!/usr/bin/env bash

set -e

CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# setup zshrc
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
