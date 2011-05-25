# ~tgyurci/.zshrc

# if shell is non interactive leave it
[[ -o interactive ]] || return

# these used for precmd, but print -P handles this (%m, %l)
#typeset -r SHORT_TTY=${${TTY#/dev/}##tty}
#typeset -r SHORT_HOST=${HOST%%.*}

# opciok
setopt AUTO_CD NO_BEEP NO_FLOW_CONTROL INTERACTIVE_COMMENTS \
	HIST_IGNORE_DUPS HIST_NO_STORE HIST_NO_FUNCTIONS \
	PUSHD_IGNORE_DUPS PUSHD_TO_HOME PUSHD_MINUS \
	BSD_ECHO NO_BG_NICE C_BASES OCTAL_ZEROES AUTO_CONTINUE

function src() {
	[[ -f "$1" ]] && source "$1"
}

if [[ -z "$UNAME_S" ]]; then
	# this is the only fork in the Zsh rc files
	typeset -r UNAME_S=$(uname -s)
	export UNAME_S
fi

# common defaults
src "$HOME/.common.sh"

# parameters
LISTMAX=0
HISTSIZE=128
unset HISTFILE
READNULLCMD=$PAGER
fignore=(.o .class)

# prompt
prompt='%n@%m:%~$ '

# vi rulez forever
bindkey -v

# if we are in a terminal change the title
case $TERM in
	xterm*|rxvt|Eterm|eterm)
		function precmd() {
			print -Pn "\033]0;%n@%m\007"
		}
	;;
	screen)
		function precmd() {
			print -Pn "\033_%n@%m\033\\"
			print -Pn "\033k%m(%l)\033\\"
		}
	;;
esac

src "$HOME/.local.sh"

unset -f src
