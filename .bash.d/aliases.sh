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
alias scpr='rsync --partial --progress --rsh=ssh'
alias sshpw='ssh -o PubkeyAuthentication=no'
alias perlprint='perl -e print -e'
alias perlfor='perl -ne' # pepe without the -p, but still implicitly iterates
alias grepp="perl -ne 'print if' -e"
alias greppv="perl -ne 'print if not' -e"
alias ll='no -l'
alias la='no -a'
alias pstat='tail -f /var/log/messages'
alias now='date +"%H:%M:%S"'
alias today='date +%Y-%m-%d'
alias isodatetime="date '+%Y-%m-%dT%H:%M:%S'"
alias isodatetimeutc="date -u '+%Y-%m-%dT%H:%M:%S'"
alias vim='vim -X'
alias rand0='rand -0'
alias ehtml="perl -pe 's/\&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g;'"
alias scr='TERM=rxvt screen -dRRA -e ^o^o' # TERM=rxvt fixes MacOS + screen "woof -- woof" problem (wtf?)
alias c='co -l' # checkout with RCS and lock for editing
if [[ $OSTYPE == darwin* ]]; then
    alias psa=pstree
    alias no='ls -G'
else
    alias psa="ps -AHf"
    alias no='ls --color'
fi
alias sup='svn up; svn log -r BASE:HEAD;'
alias less='less -Q'
alias mysql='mysql --no-beep --pager="less -Q"'
alias emacs='emacs -nw'
alias which="type -path"
alias where="type -all"
alias mkdir='mkdir -p'
alias t='tmux attach'
alias top1='top -b -n 1'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ff='find|grep -i'

# git aliases
alias g='git'
alias glog='git log --pretty=oneline|head -20|tac'
alias master='git checkout master'
alias gpre="st;git diff|grep -n 'print\|!!\|bugbug\|TODO'"
alias gm='git checkout master'
alias gstage='git checkout staging'
alias gc='git commit'
alias gs='git status'
alias gpp='git pull && (cd `groot`;git submodule update) && git push'
alias gcd='cd $(groot)' # top level of current repo
alias git-tree='git log --graph --pretty=oneline --abbrev-commit'
# alias gbranch='git status|grep branch|awk '"'"'{print $4}'"'"
# alias gmerge='~/bin/gitmerge.sh master `gbranch`'

# diagnostics
alias ping8='ping 8.8.8.8'
alias myip="ifconfig | grep inet.addr | grep -v 127.0.0.1 | awk -F: '{print $2}' | awk '{print $1}'"
alias mygate="route -n | grep ^0.0.0.0 | awk '{print $2}'"
alias pinggate='ping `mygate`'

# basic linux utils
#alias m='less -R'
#alias xx='chmod 755'
#alias xr='chmod 644'
#alias open='xdg-open'
#alias gi='grep -i'
#alias t='type'

function dns {
  dig $"@"|grep -v '\(^$\)\|^;'
}

function x80 {
  python -c "print('x' * 80)"
}
