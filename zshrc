# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# use gnu core commands with their normal names
export PATH=$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aliases
    git
    zsh-autosuggestions
    web-search
    copyfile
    dirhistory
    history
    jsontools
    zsh-z
    kubectl
    # plugins for macos:
    macos 
)

source $ZSH/oh-my-zsh.sh

# launch the starship
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# user defined aliases
alias ls='ls --color'

# Go setup
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# Bat setup
export BAT_THEME=Nord

# Python setup
export PATH=$HOME/Library/Python/3.8/bin:$PATH
