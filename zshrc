export SHELL=$(which zsh)

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
alias kct='kubectx'
alias ls='exa';
alias nv='nvim'
alias gch='git checkout'

# Go setup
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# Rust setup
export PATH=$HOME/.cargo/bin:$PATH

# local bin setup
export PATH=$HOME/.local/bin:$PATH

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

export PATH=/home/zc/.tiup/bin:$PATH
export OPENAI_API_KEY="$(cat $HOME/.secrets/openai)"
