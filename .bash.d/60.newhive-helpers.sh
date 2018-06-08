# find NewHive
NEWHIVE_HOME=$HOME/newhive
if [ ! -d $NEWHIVE_HOME ]; then NEWHIVE_HOME=/home/newhive; fi 

# aliases
alias nh=nhrepl #TODO make a cooler top level utility?
alias nhcd='cd $NEWHIVE_HOME' # go to default repo from outside 
alias nhcdproduction='cd /var/www/newhive' # go to default production home

alias nhroutes='e $(groot)/newhive/routes.json'
alias nhconfig='e $(groot)/newhive/config/config.py'
alias nhconfigcommon='e $(groot)/newhive/config/config_common.py'

alias nhrepl='nhcd; ipython -i bin/server_examples.py'
alias nhkilldev='psk server.py'
alias nhresetdev='nhcd; nhkilldev; nhstartdev'
alias nhlogproduction='less +F /var/log/apache2/error.log'
alias nhshellhelpers='e `groot`/bin/shell_helpers.sh'

alias nhadmin='ssh -i .ssh/google_compute_engine admin.newhive.com'
#alias nhdevsh='ssh dev-0.thenewhive.com'

# server management
function psk(){
   if pgrep -f $1; then
       pgrep -f $1 | xargs kill;
   else
       return 1;
   fi
} 

function nhstartdev() {(
  nhcd
  ./server.py $*
)}
