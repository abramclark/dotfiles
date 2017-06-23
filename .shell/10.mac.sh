if [[ $OSTYPE != darwin* ]]; then return; fi

export PATH="/usr/local/sbin:$PATH" # for brew
alias ls='ls -G'
alias routes='netstat -nr | head -n 15'
