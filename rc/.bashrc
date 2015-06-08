# ~tgyurci/.bashrc

umask 022

#[[ $- != *i* ]] && return
[ -z "$PS1" ] && return

function src() {
	[ -f "$1" ] && source "$1"
}

if [ -z "$UNAME_S" ]; then
	UNAME_S=$(uname -s)
	export UNAME_S
fi

src "$HOME/.common.sh"

HISTCONTROL=ignoreboth
unset HISTFILE
HISTFILESIZE=0
HISTSIZE=1024
PS1='\u@\h:\w\$ '

if [ -z "$HOST_S" ]; then
	HOST_S="${HOSTNAME%%.*}"
	export HOST_S
fi

if [ -z "$TTY_S" ]; then
	TTY=$(tty)
	TTY_S=${TTY#/dev/}
	TTY_S=${TTY_S##tty}
	export TTY_S
fi

shopt -s checkwinsize

case "$TERM" in
	xterm*|rxvt|Eterm|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOST_S}\007"'
	;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOST_S}\033\\"; echo -ne "\\033k${HOST_S}($TTY_S)\033\\"'
	;;
esac

src "$HOME/.local.sh"

unset command_not_found_handle
unset src
