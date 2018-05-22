if [ "$PS1" ]; then # if interactive...
    for src in ~/.bash.d/*.sh;
        do source $src;
    done
fi
