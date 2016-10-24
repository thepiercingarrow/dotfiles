# .bashrc

# Aliases
alias ls="ls --color"
alias la="ls -a"
alias e="emacs"
alias s="sandy"
alias p="pacaur"
alias mv="mv -i"
alias cp="cp -i"
alias rm="trash"
alias ptpb="pbpst"
alias scrot="scrot -e 'mv \$f ~/screenshots'"
alias ddnet="teeworlds-ddnet"
alias suspend="systemctl suspend"
alias visudo="sudo EDITOR=emacs visudo"
alias df="df -h"
alias free="free -h"

alias csvcat="column -s, -t"

alias clone="git clone"
alias add="git add --all"
alias pull="git pull"
alias commit="git commit"
alias push="git push"

# Env
export EDITOR="emacs"
export VISUAL="emacs"
export CC="gcc"

# Functions

trash() {
    local path="$HOME/.Trash"
    mkdir -p $path
    for file in $@; do
	echo "Trashing: $file"
	mv -f $file $path/
    done
}

emptytrash() {
    local path="$HOME/.Trash/"
    /usr/bin/env rm -rf $path
}

ix() {
    local opts
    local OPTIND
    [ -f "$HOME/.netrc" ] && opts='-n'
    while getopts ":hd:i:n:" x; do
        case $x in
            h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
            d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
            i) opts="$opts -X PUT"; local id="$OPTARG";;
            n) opts="$opts -F read:1=$OPTARG";;
        esac
    done
    shift $(($OPTIND - 1))
    [ -t 0 ] && {
        local filename="$1"
        shift
        [ "$filename" ] && {
            curl $opts -F f:1=@"$filename" $* ix.io/$id
            return
        }
        echo "^C to cancel, ^D to send."
    }
    curl $opts -F f:1='<-' $* ix.io/$id
}

# Clear history
history -c
/usr/bin/env rm -f ~/.bash_history
