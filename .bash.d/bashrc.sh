function source_maybe { [ -f $1 ] && source $1; }
source_maybe /etc/bash_completion
source_maybe /usr/local/etc/bash_completion
source_maybe /usr/local/share/bash-completion/bash_completion
source_maybe /usr/local/etc/profile.d/bash_completion.sh
source_maybe /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source_maybe ~/.ssh/agent

export PATH="${HOME}/bin:${PATH}";

# misc stuff
stty -ixon #disable ctrl+s locking
#duplicate commands and those prepended with a space are not logged
HISTCONTROL=ignoreboth 
HISTFILESIZE=100000

# vars
export EDITOR=vim
export PAGER='less -RF' # leave color escapes, cat if file smaller than term
export QHOME=~/bin/q-lang/
IFS=$(echo -e " \n	")

# update and read cmd history immediately
shopt -s histappend                      # append to history, don't overwrite it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

## set prompt

function git_branch {
    b=$(git symbolic-ref HEAD 2> /dev/null);
    if [ $b ]; then echo -n "(${b##refs/heads/})"; fi
}

function bash_prompt_init {
    local normal=$(echo -e '\033[0;0m')
    local box_name=${HOSTNAME/.*/}

    PS1="\[$prompt_color\](\w)\[$normal\]\$(git_branch)\[$prompt_color\]@$box_name \[$normal\]"

    # show prompt in red if root
    if [ "$UID" = "0" ]; then prompt_color=$Red; fi 
}
bash_prompt_init
