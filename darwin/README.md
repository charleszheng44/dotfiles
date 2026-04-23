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
brew install --cask ghostty
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

| Source                   | Target                    |
| ------------------------ | ------------------------- |
| `darwin/zshrc`           | `~/.zshrc`                |
| `darwin/zsh`             | `~/.zsh`                  |
| `darwin/tmux.conf`       | `~/.tmux.conf`            |
| `darwin/tmux`            | `~/.tmux`                 |
| `darwin/ideavimrc`       | `~/.ideavimrc`            |
| `darwin/starship.toml`   | `~/.config/starship.toml` |
| `darwin/nvim`            | `~/.config/nvim`          |
| `darwin/ghostty`         | `~/.config/ghostty`       |
| `fzf-git.sh`             | `~/.config/fzf-git.sh`    |

## 7. Install language toolchains (as needed)

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

## 8. kubectl extras (optional)

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

## 9. Reload the shell

```bash
exec zsh
```

## Notes

- Re-running `./setup.sh` is safe — it removes stale files/links before recreating them.
- The `you-should-use` oh-my-zsh plugin is referenced in `zshrc`; step 5 installs it.
