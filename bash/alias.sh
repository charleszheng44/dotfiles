alias tmux='tmux -2'
alias ..='cd ..'
alias ls='ls -G'
alias o='open'
alias t='TERM=screen-256color-bce tmux -2'
alias tmux='TERM=screen-256color-bce tmux -2'
alias vim='nvim'
alias v='nvim'
alias a='ag'

# git alias
alias glg='git log --graph --oneline' 
alias gbr='git branch'
alias gad='git add'
alias gst='git status'
alias gcm='git commit'
alias gch='git checkout'
alias gph='git push'
alias gpl='git pull'
alias gft='git fetch'
alias grb='git rebase'
alias gdif='git diff'
alias gam='git add $(git ls-files -m)'
alias gau='git add $(git ls-files -o)'

# bookmark alias
alias lb='list_bookmarks'
alias ab='add_bookmark'
alias gb='goto_bookmark'
alias db='delete_bookmark'

alias r='ranger'

# aliases for Linux
if [ "$(uname)" == "Linux" ];
then
    alias o='xdg-open'  
fi
