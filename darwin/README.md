# macOS Dotfiles Setup

Step-by-step setup for a fresh macOS machine. Run the blocks in order.

## 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Apple Silicon: add brew to the current shell PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 2. Clone this repo

```bash
mkdir -p ~/Works
git clone https://github.com/<your-user>/dotfiles.git ~/Works/dotfiles
cd ~/Works/dotfiles
```

## 3. Install CLI tools

```bash
brew install \
  neovim \
  tmux \
  starship \
  fzf \
  bat \
  eza \
  ripgrep \
  fd \
  lazygit \
  coreutils \
  reattach-to-user-namespace \
  git
```

```bash
# fzf keybindings + completion
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
```

## 4. Install GUI apps (optional)

```bash
brew install --cask alacritty ghostty
brew install --cask nikitabobko/tap/aerospace
brew install --cask sketchybar
```

## 5. Install oh-my-zsh and plugins

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
```

## 6. Symlink dotfiles

```bash
cd ~/Works/dotfiles/darwin
./setup.sh
```

This links:

| Source                        | Target                        |
| ----------------------------- | ----------------------------- |
| `darwin/zshrc`                | `~/.zshrc`                    |
| `darwin/zsh`                  | `~/.zsh`                      |
| `darwin/tmux.conf`            | `~/.tmux.conf`                |
| `darwin/tmux`                 | `~/.tmux`                     |
| `darwin/starship.toml`        | `~/.config/starship.toml`     |
| `darwin/alacritty`            | `~/.config/alacritty`         |

For the configs `setup.sh` does not cover yet, link them manually:

```bash
mkdir -p ~/.config
ln -sfn ~/Works/dotfiles/darwin/nvim       ~/.config/nvim
ln -sfn ~/Works/dotfiles/darwin/ghostty    ~/.config/ghostty
ln -sfn ~/Works/dotfiles/darwin/aerospace  ~/.config/aerospace
ln -sfn ~/Works/dotfiles/darwin/sketchybar ~/.config/sketchybar
ln -sfn ~/Works/dotfiles/darwin/ideavimrc  ~/.ideavimrc
ln -sfn ~/Works/dotfiles/fzf-git.sh        ~/.config/fzf-git.sh
```

## 7. Install tmux plugin manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# after starting tmux, press: Ctrl-q + I  (capital I) to install plugins
```

## 8. Install language toolchains (as needed)

```bash
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Go
brew install go

# JVM via SDKMAN
curl -s "https://get.sdkman.io" | bash

# Node via gvm-style manager (optional)
# or:  brew install nvm
```

## 9. kubectl extras (optional)

```bash
brew install kubectl kubectx

# krew plugin manager
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
```

## 10. Reload the shell

```bash
exec zsh
```

## Notes

- Re-running `./setup.sh` is safe — it removes stale files/links before recreating them.
- The `nopctl completion zsh` line at the bottom of `zshrc` is Netflix-specific; remove it if you don't have `nopctl` installed.
- The `you-should-use` oh-my-zsh plugin is referenced in `zshrc`; step 5 installs it.
