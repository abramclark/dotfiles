function g {(
    # find files in git repository with names or content matching
    # given regex

    while true; do
        case "$1" in
            -c) case=true;shift;;
            -o) open=true;shift;;
            -n) search_name=true;shift;;
            -f) force=true;shift;;
            # -a) all=true;shift;;
            -p) shift; path_match="$1"; shift;;
            *) break 2;
        esac
    done

    case_flag='-i'
    if [ $case ]; then case_flag=''; fi

    if [ $search_name ]; then
        git ls-files "$path_match" | grep $case_flag $* > ~/.efffiles
    else
        git grep $case_flag -n --no-color $* -- "$path_match" > ~/.efffiles
    fi

    # list (and number) the matches
    effpat=$(echo $@|awk '{print $NF}')
    echo $effpat >> ~/.eff.log
    grep $case_flag --color $effpat -n ~/.efffiles

    if [ $open ] && ( [ $force ] || [ 1 == $(wc -l < ~/.efffiles) ] ); then
        o 1
    fi
)}

# Search python definition
function ad {(
    grepvar=$1
    shift
    g -p *.py $* "def.*$grepvar"
)}
function n  { g -o -n $*; }
function nhtml { g -o -p \*.html -n $*; }
function nscss { g -o -p \*.scss -n $*; }
function npy { g -o -p \*.py -n $*; }
function njs { g -o -p \*.js -n $*; }
function ghtml { g -o -p \*.html $*; }
function gscss { g -o -p \*.scss $*; }
function gpy { g -o -p \*.py $*; }
function gjs { g -o -p \*.js $*; }

# open nth file in ~/.efffiles
function o {(
    line=$1
    if [ -z $line ]; then
        line="1"
    fi
    e $(sed ${line}'q;d' $HOME/.efffiles | awk '{print $1}')
)}
