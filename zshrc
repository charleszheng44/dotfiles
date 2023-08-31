export SHELL=$(which zsh)

if [[ $(uname) == "Darwin" ]]
then
    # If you come from bash you might have to change your $PATH.
    export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH
    # use gnu core commands with their normal names
    export PATH=$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/${USER}/opt/google-cloud-sdk/path.zsh.inc' ]
    then 
        . '/Users/${USER}/opt/google-cloud-sdk/path.zsh.inc'
    fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/${USER}/opt/google-cloud-sdk/completion.zsh.inc' ]
    then 
        . '/Users/${USER}/opt/google-cloud-sdk/completion.zsh.inc'
    fi
fi

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
    z
    kubectl
    # plugins for macos:
    macos 
)

source $ZSH/oh-my-zsh.sh

# launch the starship
eval "$(starship init zsh)"

export FZF_DEFAULT_OPTS="--multi \
--height=50% \
--margin=1%,1%,1%,1% \
--layout=reverse-list \
--border=rounded \
--info=inline \
--prompt='$>' \
--pointer='→' \
--marker='♡' \
--header='CTRL-c or ESC to quit' \
--color='dark,fg:magenta'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# user defined aliases
# alias ls='ls --color'
alias ls='exa';
alias nv='nvim'
alias gch='git checkout'
alias kustomize='kubectl kustomize'
alias kct='kubectl ctx'
alias kns='kubectl ns'
alias bat='bat --theme="Catppuccin-mocha"'
go() {
    if [ $1 = "doc" ]; then
        shift
        command go doc $@ | bat -l go --style=plain 
    else
        command go "$@"
    fi
}


# Local bin setup
export PATH=$HOME/.local/bin:$PATH

# Go setup
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# Rust setup
export PATH=$HOME/.cargo/bin:$PATH

# Java setup for osx
if [[ $(uname) == "Darwin" ]]
then
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
fi

# kubectl shortcuts
source $HOME/.zsh/kubectl_alias.sh

export EDITOR=nvim

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# fzf git branch checkout
#
fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}


fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}
alias gco='fzf-git-checkout'

autoload -U compinit && compinit

export OPENAI_API_KEY="$(cat $HOME/.secrets/openai)"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv setup
eval "$(pyenv init --path)"
