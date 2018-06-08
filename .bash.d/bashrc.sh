function source_maybe { [ -f $1 ] && source $1; }
source_maybe /etc/bash_completion
source_maybe /usr/local/etc/bash_completion
source_maybe /usr/local/share/bash-completion/bash_completion
source_maybe ~/.ssh/agent

# misc stuff
stty -ixon #disable ctrl+s locking
#duplicate commands and those prepended with a space are not logged
HISTCONTROL=ignoreboth 
HISTFILESIZE=100000

# vars
export EDITOR=vim
export PAGER=less
export LESS='-R' # proper less color escape interpretation (for ipython)
export QHOME=~/bin/q-lang/
IFS=$(echo -e " \n	")


## set prompt

function set_color {
    echo -e "\033[38;05;${1}m"
}

function git_branch {
    b=$(git symbolic-ref HEAD 2> /dev/null);
    if [ $b ]; then echo -n "(${b##refs/heads/})"; fi
}

function __main__ {
    local normal=$(echo -e '\033[0;0m')
    local box_name=${HOSTNAME/.*/}

    PS1="\[$prompt_color\](\w)\[$normal\]\$(git_branch)\[$prompt_color\]@$box_name \[$normal\]"

    # show prompt in red if root
    if [ "$UID" = "0" ]; then prompt_color=$Red; fi 
}
__main__
