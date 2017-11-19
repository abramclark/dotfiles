if [ "$PS1" ]; then # if interactive...
    for src in ~/.shell/*.sh;
        do source $src;
    done
fi
