# ~tgyurci/.zshrc

# Preinit

## If the shell is not interactive, leave it.
[[ -o interactive ]] || return

# Options

## Changing Directories
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_TO_HOME PUSHD_MINUS

## Completion
setopt ALWAYS_TO_END

## History
setopt HIST_FIND_NO_DUPS HIST_IGNORE_DUPS HIST_NO_STORE HIST_REDUCE_BLANKS

## Input/Output
setopt NO_FLOW_CONTROL INTERACTIVE_COMMENTS

## Job Control
setopt AUTO_CONTINUE NO_BG_NICE LONG_LIST_JOBS

## Scripts and Functions
setopt C_BASES OCTAL_ZEROES

## Shell Emulation
setopt BSD_ECHO

## Zle
setopt NO_BEEP COMBINING_CHARS

# Init

src() {
	[[ -f "$1" ]] && source "$1"
}

## Set UNAME_S for .shrc
if [[ -z "$UNAME_S" ]]; then
	# this is the only fork in the Zsh rc files
	typeset -r UNAME_S=$(uname -s)
fi

## Common configuration
src "$HOME/.shrc"

# Parameters

DIRSTACKSIZE=20
fignore=(.class .o .swp)
HISTSIZE=128
unset HISTFILE
LISTMAX=0
READNULLCMD="$PAGER"

## Prompt: user@host:dir$ or root@host:dir# with bold host and user
if [[ "$UID" == "0" ]]; then
	PROMPT='%B%n%b@%B%m%b:%~# '
else
	PROMPT='%n@%m:%~$ '
fi

## Right prompt
RPROMPT='%(3V.%3v .)%(2V.%B%2v%b .)%(1V.%1v .)%B?%?%b'

if [[ -o login ]]; then
	RPROMPT="$RPROMPT %UL%L%u"
else
	RPROMPT="$RPROMPT L%L"
fi

case "$TERM" in
	(screen*) ;;
	(*) RPROMPT="$RPROMPT %l" ;;
esac

# Functions

## Terminal title
case "$TERM" in
	(xterm*)
		precmd() {
			print -Pn '\e]0;%n@%m%(4V. [%4v].)\a'
		}
	;;
	(screen*)
		precmd() {
			print -Pn '\e_%n@%m%(4V. [%4v].)\e\\'
			print -Pn '\ek%m(%l)\e\\'
		}
	;;
esac

## Extra prompt info functions

set-vi-mode-prompt() {
	local mode

	case "$KEYMAP" in
		(viins|main)
			case "$ZLE_STATE" in
				(*insert*) mode="I" ;;
				(*overwrite*) mode="R" ;;
				(*) mode="I?" ;;
			esac
		;;
		(vicmd) mode="N" ;;
		(*) mode="?" ;;
	esac

	psvar[2]="$mode"
}

set-histno-prompt() {
	local hist

	if [[ "$HISTNO" == "$HISTCMD" ]]; then
		hist="!$HISTNO"
	else
		hist="!${HISTCMD}/${HISTNO}"
	fi

	psvar[1]="$hist"
}

## Zle widgets

zle-history-line-set() {
	set-histno-prompt
	zle reset-prompt
}

zle-keymap-select() {
	set-vi-mode-prompt
	zle reset-prompt
}

zle-line-init() {
	set-vi-mode-prompt
	set-histno-prompt
	zle reset-prompt
}

## Autoload functions

autoload edit-command-line
autoload zargs
autoload zmv

# Zle widgets

zle -N edit-command-line
zle -N zle-history-line-set
zle -N zle-keymap-select
zle -N zle-line-init

# Keybindings

bindkey -v

bindkey -M vicmd '^Xv' edit-command-line
bindkey -M viins '^Xv' edit-command-line
bindkey -M vicmd '^X^V' edit-command-line
bindkey -M viins '^X^V' edit-command-line

# Aliases

alias d='dirs -v'
alias po='popd'
alias pu='pushd'

# Local configuration

src "$HOME/.zshrc.local"

# Cleanup

unset -f src
