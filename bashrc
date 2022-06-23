# Set the terminal color 
export TERM=xterm-256color

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
    then
		# STAT=`parse_git_dirty`
		# echo "[${BRANCH}${STAT}]"
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]> \[\e[m\]\[\e[34m\]\W\[\e[m\] \[\e[31m\]\`parse_git_branch\`\[\e[m\] "

# aliases
source $HOME/Works/dotfiles/bash/alias.sh
source $HOME/Works/dotfiles/bash/alias_cmd.sh

# apps 
source $HOME/Works/dotfiles/bash/bookmark.sh

# setup shortcuts for the fzf
[ -f $HOME/Works/dotfiles/fzf.bash ] && source $HOME/Works/dotfiles/fzf.bash

export EDITOR=nvim
export BASH_SILENCE_DEPRECATION_WARNING=1

# go related setting
export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$HOME/Works/go
export PATH=$PATH:$HOME/go/bin

# rust related setting
export PATH=$PATH:$HOME/.cargo/bin
source "$HOME/.cargo/env"
. "$HOME/.cargo/env"

export BAT_THEME="gruvbox-dark"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 --plain {}'"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# enable extglob
shopt -s extglob

# Wasm
export PATH=$PATH:/usr/local/wabt-1.0.24/bin
## wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
## wasmer
export WASMER_DIR="/Users/admin/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# osx related
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

# enable the z command
source /usr/local/etc/profile.d/z.sh

export PATH=$HOME/.tiup/bin:$PATH
