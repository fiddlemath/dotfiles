# /etc/skel/.bashrc:
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

. $HOME/.bash-vars

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489

case $TERM in
    xterm*|rxvt*|Eterm|vt100|screen|tmux)
        export PROMPT_COMMAND='
export HOSTNAME=`hostname`
SHORTPATH="${PWD/$HOME/~}"
export PS1="\[\033[32m\]\u @ \h \[\033[00;35m\]\t \[\033[01;34m\]${SHORTPATH}\n\\\$\[\033[00m\] "
echo -ne "\033]0;${USER} @ ${HOSTNAME%%\.*}:${PWD##*\/}\007"
'
        export TERM=xterm
        export COLORTERM=Terminal
    ;;

    eterm-color)
        export PROMPT_COMMAND='
export HOSTNAME=`hostname`
SHORTPATH="${PWD/$HOME/~}"
export PS1="\[\033[32m\]\u @ \h \[\033[00;35m\]\t \[\033[01;34m\]${SHORTPATH}\n\\\$\[\033[00m\] "
'
    ;;
    dumb)
        export PS1="\u @ \h \t \w\n$ "
	alias ls='ls -F'
    ;;
esac
