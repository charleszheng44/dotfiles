if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# Set the terminal color 
export TERM=xterm-256color

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
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

# golang env setup
export GOPATH="/Users/zc/Work/go"
export PATH=$PATH:$GOPATH/bin

# cctools env setup
export cctools="/Users/zc/Work/ccl-wk/cctools"
export CCTOOLS="/Users/zc/cctools"
export PATH=$PATH:$CCTOOLS/bin

# fzf keybinding
source ~/.key-bindings.sh

source ~/.config/bash/alias.sh
source ~/.config/bash/alias_cmd.sh

# apps 
source ~/.config/bash/bookmark.sh

# make sure mojave can find perl lib installed by brewperl
export PATH=/usr/local/bin:$PATH

# git autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}



[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GOOGLE_APPLICATION_CREDENTIALS="/Users/zc/Work/gcloud/credentials/mf-kube-oper-monitoring-admin.json"

export EDITOR=nvim
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/opt/python@3.9/bin":$PATH

source "$HOME/.cargo/env"


