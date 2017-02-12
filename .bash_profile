export PATH="$HOME/bin:$HOME/Library/Haskell/bin:$PATH"

if [ "$PS1" ]; then # if interactive...
	for src in ~/.shell/*; do source $src; done
fi

##
# Your previous /Users/abram/.bash_profile file was backed up as /Users/abram/.bash_profile.macports-saved_2015-11-07_at_00:22:02
##

# MacPorts Installer addition on 2015-11-07_at_00:22:02: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

