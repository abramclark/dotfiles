# Bash already sets $OSTYPE
#OS='unknown'
#unamestr=`uname`
#if [[ "$unamestr" == 'Linux' ]]; then
#   OS='linux'
#elif [[ "$unamestr" == 'FreeBSD' ]]; then
#   OS='freebsd'
#fi

# find NewHive
NEWHIVE_HOME=$HOME/newhive
if [ ! -d $NEWHIVE_HOME ]; then NEWHIVE_HOME=/var/www/newhive; fi 
