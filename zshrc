# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
plugins=(
    aliases
    fzf
    git
    zsh-autosuggestions
    web-search
    copyfile
    dirhistory
    history
    jsontools
    z
    kubectl
    you-should-use
    # plugins for macos:
    macos 
)

source $ZSH/oh-my-zsh.sh

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

export FZF_CTRL_T_COMMAND='find . -type f -not -path "*/\.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# user defined aliases
# alias ls='ls --color'
alias ls='eza';
alias nv='nvim'
alias gch='git checkout'
alias kct='kubectl ctx'
alias kns='kubectl ns'
alias lg='lazygit'
alias bat='bat --theme="base16"'
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

# kubectl shortcuts
source $HOME/.zsh/kubectl_alias.sh

export PATH=/usr/local/nvim/bin/:$PATH

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

# export OPENAI_API_KEY="$(cat $HOME/.secrets/openai)"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv setup for non debian dist
# eval "$(pyenv init --path)"

# tad auto completion
# source <(TAD_OFFLINE=1 tad zsh-completion)

# pyenv setup for debian dist
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ -s "/Users/charlesz/.gvm/scripts/gvm" ]] && source "/Users/charlesz/.gvm/scripts/gvm"

# load the openai api key if exist
[[ -f ~/.openai_api_key ]] && export OPENAI_API_KEY=$(<~/.openai_api_key)

export PATH=$HOME/Works/ai-tools/bin:$PATH

# # Update PATH for the Google Cloud SDK.
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# Enable command-line completion for gcloud.
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
