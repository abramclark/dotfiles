#! /bin/bash
filter_broken="/fonts/|/curl|google_closure.js|/d3/|codemirror.js|/codemirror/|/browser/jquery|mobile/[pt]|mobile/app/[^w]|zepto-"

function open_file {
    (which e > /dev/null) && e $@ || $EDITOR $@
}
alias grep_cmd="grep -E"
# TODO: comment me
function git_grep {(
    path_match=""
    while true; do
        case "$1" in
            -i) case=true;shift;;
            -o) open=true;shift;;
            -n) search_name=true;shift;;
            -f) force=true;shift;;
            -f) filter_broken="";shift;;
            # -a) all=true;shift;;
            -p) shift; path_match="$1"; shift;;
            *) break 2;
        esac
    done

    case_flag='-i'
    if [ $case ]; then case_flag=''; fi

    if [ "$search_name" ]; then
        if [ -z "$path_match" ]; then path_match="."; fi
        git ls-files "$path_match" | grep_cmd $case_flag $* > ~/.efffiles
        if [ $filter_broken ]; then
            grep_cmd -v $filter_broken ~/.efffiles > ~/.efffiles_temp
            mv -f ~/.efffiles_temp ~/.efffiles
        fi
        # echo "git ls-files \"$path_match\" | grep_cmd $case_flag $* > ~/.efffiles"
    else
        git grep $case_flag -n --no-color $* -- $path_match | perl -pe 's/^(.*?:\d+):/$1 /' > ~/.efffiles
        if [ $filter_broken ]; then
            grep_cmd -v $filter_broken ~/.efffiles > ~/.efffiles_temp
            mv -f ~/.efffiles_temp ~/.efffiles
        fi
    fi

    # list (and number) the matches
    effpat=$(echo $@|awk '{print $NF}')
    echo $effpat >> ~/.eff.log
    grep_cmd $case_flag --color $effpat -n ~/.efffiles

    if [ $open ] && ( [ $force ] || [ 1 == $(wc -l < ~/.efffiles) ] ); then
        open_nth 1
    fi
)}

# nth filename:lineno: in ~/.efffiles
function matched_file_and_line {(
    line=$1
    if [ -z $line ]; then
        line="1"
    fi
    echo $(sed ${line}'q;d' $HOME/.efffiles | awk '{print $1}'|sed 's/\(:[0-9]\+:\).*/\1/')
)}
# print the nth filename
function matched_file {(
    echo $(matched_file_and_line $1 | sed 's/:[0-9]\+://')
)}
# open nth file in ~/.efffiles
function open_nth {(
    open_file `matched_file_and_line $1`
)}
# rerun last list 
alias rerun_results='grep_cmd . ~/.efffiles | grep_cmd -n -i `tail -1 ~/.eff.log`'
# rerun last list, but only accept matches in last file part
alias filepart_results='grep_cmd . ~/.efffiles | grep_cmd -n -i `tail -1 ~/.eff.log`[^/]*$'
# rerun last list, filtered through grep_cmd
function grep_results {(
    # echo to stdout w/ color
    rerun_results|grep_cmd $*| grep_cmd --color=always -i `tail -1 ~/.eff.log`
    rerun_results|grep_cmd $*| grep_cmd --color=never -i `tail -1 ~/.eff.log` > ~/.grep_results
    if [ 1 == $(wc -l < ~/.grep_results) ]; then
        file="$(cat ~/.grep_results|awk '{print $1}'|sed 's/\(:[0-9]\+:\).*/\1/'|sed 's/^[0-9]\+://')"
        echo "opening $file"
        open_file $file
    fi
)}

# Search python definition
function grep_python_def {(
    grepvar=$1
    shift
    git_grep -o -p "*.py" $* "def[^(]*$grepvar"
)}
