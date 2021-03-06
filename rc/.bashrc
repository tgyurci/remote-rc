# ~tgyurci/.bashrc

umask 022

#[[ $- != *i* ]] && return
[[ -n "$PS1" ]] || return

src() {
	if [[ -f "$1" ]]; then
		source "$1"
	fi
}

if [[ -z "$UNAME_S" ]]; then
	UNAME_S=$(uname -s)
fi

# Common configuration
src "$HOME/.shrc"

HISTCONTROL=ignoreboth
unset HISTFILE
HISTFILESIZE=0
HISTSIZE=2048
PS1='\u@\h:\w\$ '

if [[ -z "$HOST_S" ]]; then
	HOST_S="${HOSTNAME%%.*}"
fi

if [[ -z "$TTY_S" ]]; then
	TTY=$(tty)
	TTY_S=${TTY#/dev/}
	TTY_S=${TTY_S##tty}
fi

shopt -s checkwinsize

case "$TERM" in
	(xterm*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOST_S}\007"'
	;;
	(screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOST_S}\033\\"; echo -ne "\\033k${HOST_S}($TTY_S)\033\\"'
	;;
esac

# Local configuration
src "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.bashrc.local"
src "$HOME/.bashrc.local"

unset command_not_found_handle
unset src
