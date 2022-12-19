# TODO: section and sort into at least somewhat sensible order

alias sar='perl -pe' # perlish sed
alias sqlite='python -c "import apsw;apsw.main()"'
#alias ssh='ssh -3' # for when ssh 5.8 is installed
alias iv=gliv
# TODO: make aliases work with completion
# alias apts='apt-cache search'
# alias apti='sudo apt-get install'
# alias aptp='sudo apt-get remove --purge'
alias mplayercam='mplayer -vf screenshot tv://'
#alias gi='grep -iP'
#alias gr='grep -P'
alias lsf='find $(pwd) -type f'
alias today='date +%Y-%m-%d'
alias now='date +"%H:%M:%S"'
alias datetime='date "+%Y-%m-%dT%H:%M:%S"'
alias datetimeutc='date -u "+%Y-%m-%dT%H:%M:%S"'
alias scpr='rsync --partial --progress --rsh=ssh'
alias sshpw='ssh -o PubkeyAuthentication=no'
alias perlprint='perl -e print -e'
alias perlfor='perl -ne' # iterate expr over lines of stdin
alias grepp="perl -ne 'print if' -e"
alias greppv="perl -ne 'print if not' -e"
alias ll='no -l'
alias la='no -a'
alias pstat='tail -f /var/log/messages'
alias rand0='rand -0'
alias ehtml="perl -pe 's/\&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g;'"
alias which="type -path"
alias where="type -all"
alias mkdir='mkdir -p'
alias t='tmux -CC attach'
alias top1='top -b -n 1'
alias fcut='sed -E "s/ +/\t/g"|cut -f' # grab ${1}th column separated by spaces or tab

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ff='find|grep -i'

# diagnostics
alias ping8='ping 8.8.8.8'
alias myip="ifconfig | grep inet.addr | grep -v 127.0.0.1 | awk -F: '{print $2}' | awk '{print $1}'"
alias mygate="route -n | grep ^0.0.0.0 | awk '{print $2}'"
alias pinggate='ping `mygate`'

if [[ $OSTYPE == darwin* ]]; then
    alias psa=pstree
    alias no='ls -G'
    alias brewinst='HOMEBREW_NO_AUTO_UPDATE=1 brew install'
else
    alias psa="ps -AHf"
    alias no='ls --color'
fi

# basic linux utils
#alias m='less -R'
#alias xx='chmod 755'
#alias xr='chmod 644'
#alias open='xdg-open'
#alias gi='grep -i'
#alias t='type'

# for historical interest
#alias scr='TERM=rxvt screen -dRRA -e ^o^o' # TERM=rxvt fixes MacOS + screen "woof -- woof" problem (wtf?)
#alias c='co -l' # checkout with RCS and lock for editing
#alias sup='svn up; svn log -r BASE:HEAD;'
#alias less='less -Q'
#alias mysql='mysql --no-beep --pager="less -FQ"'
#alias emacs='emacs -nw'

function dns {
  dig $"@"|grep -v '\(^$\)\|^;'
}

function x80 {
  python -c "print('x' * 105)"
}
