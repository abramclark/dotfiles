if [[ $OSTYPE != darwin* ]]; then return; fi

alias ls='ls -G'
alias routes='netstat -nr | head -n 15'
