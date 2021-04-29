#!/bin/sh

# git root dir
alias groot='git rev-parse --show-toplevel'

git_branch() {
    b=$(git symbolic-ref HEAD 2> /dev/null);
    if [ $b ]; then echo -n "${b##refs/heads/}"; fi
}

# git binary search.  check out the a commit $1 commits back from HEAD
function ghis {(
    branch=$2
    if [ -z $branch ]; then
        branch="master"
    fi
    git checkout $branch > /dev/null 2>&1
    git log --pretty=oneline|head -$1|tail -1|awk '{print $1}'
)}
function gbin {
    git checkout `ghis $*`
}

# git log, print the last $1 commits, 1 line per commit
function glog {
    lines=$1
    if [ -z $lines ]; then
        lines="20"
    fi
    git log --pretty=oneline|head -$lines
}

alias gr="git_grep -o"
alias grh="git_grep -o -p '*.html'"
alias grs="git_grep -o -p '*.scss'"
alias grp="git_grep -o -p '*.py'"
alias grj="git_grep -o -p '*.js'"
alias grpd="grep_python_def"
alias gn="git_grep -o -n"
alias gnh="git_grep -o -p '*.html' -n"
alias gns="git_grep -o -p '*.scss' -n"
alias gnp="git_grep -o -p '*.py' -n"
alias gnj="git_grep -o -p '*.js' -n"

alias o='open_nth'
alias o1='o 1'
alias o2='o 2'
alias o3='o 3'
alias o4='o 4'
alias o5='o 5'

alias nnn=matched_file_and_line
alias nn=matched_file
# rerun last list 
alias on=rerun_results
# rerun last list, but only accept matches in last file part
alias oe=filepart_results
# rerun last list, filtered through grep
alias og=grep_results

alias gitloggraph='git log --graph --pretty=oneline --abbrev-commit --color=always|less -RS'
