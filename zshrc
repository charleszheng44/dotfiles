if [[ $(uname) == "Darwin" ]]
then
    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
    # use gnu core commands with their normal names
    export PATH=$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/zc/opt/google-cloud-sdk/path.zsh.inc' ]
    then 
        . '/Users/zc/opt/google-cloud-sdk/path.zsh.inc'
    fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/zc/opt/google-cloud-sdk/completion.zsh.inc' ]
    then 
        . '/Users/zc/opt/google-cloud-sdk/completion.zsh.inc'
    fi

    # Python setup
    export PATH=$HOME/Library/Python/3.8/bin:$PATH
fi
export PATH=$HOME/.local/bin:$PATH

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
# alias ls='ls --color'
alias kct='kubectx'
alias ls='exa';
alias nv='nvim'

# Go setup
# export PATH=/usr/local/go/bin:$PATH
# export PATH=$HOME/go/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# Bat setup
export BAT_THEME=Catppuccin-mocha

source $HOME/Works/dotfiles/zsh/kubectl_alias.sh

# eks provider dev alias
function en() {
    GOFLAGS="-tags=e2e" nvim $@
}

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# set the default editor
export EDITOR='nvim'
export VISUAL='nvim'

# set the AWS profile
export AWS_PROFILE=dbaas-dev
