# ~tgyurci/.zshrc

# Preinit

## If the shell is not interactive leave it
[[ -o interactive ]] || return

# Options

## Changing Directories
setopt AUTO_CD PUSHD_IGNORE_DUPS PUSHD_TO_HOME PUSHD_MINUS

## Completion
setopt ALWAYS_TO_END

## History
setopt HIST_IGNORE_DUPS HIST_NO_STORE HIST_NO_FUNCTIONS HIST_REDUCE_BLANKS

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

## Set UNAME_S for .common.sh
if [[ -z "$UNAME_S" ]]; then
	# this is the only fork in the Zsh rc files
	typeset -r UNAME_S=$(uname -s)
	export UNAME_S
fi

## Common defaults
src "$HOME/.common.sh"

# Parameters

fignore=(.class .o .swp)
HISTSIZE=128
unset HISTFILE
LISTMAX=0
READNULLCMD="$PAGER"

## Prompt: user@host:dir$
if [[ "$UID" = "0" ]]; then
	PROMPT='%B%n%b@%B%m%b:%~# '
else
	PROMPT='%n@%m:%~$ '
fi

## Right prompt
case "$TERM" in
	screen*)
		RPROMPT="%3v%2v%1v%B?%?%b L%L"
	;;
	*)
		RPROMPT="%3v%2v%1v%B?%?%b L%L T%l"
	;;
esac

# Functions

## Terminal title
case "$TERM" in
	xterm*)
		precmd() {
			print -Pn "\033]0;%n@%m\007"
		}
	;;
	screen*)
		precmd() {
			print -Pn "\033_%n@%m\033\\"
			print -Pn "\033k%m(%l)\033\\"
		}
	;;
esac

## Extra prompt info functions

set-vi-mode-prompt() {
	psvar[2]="${${KEYMAP/vicmd/N}/(main|viins)/I} "
}

set-histno-prompt() {
	psvar[1]="!$HISTNO "
}

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

typeset -a autoload_functions
autoload_functions=( edit-command-line zargs zmv )

for autoload_function in $autoload_functions; do
	autoload "$autoload_function"
done

# Zle widgets

typeset -a zle_widgets
zle_widgets=( edit-command-line zle-history-line-set zle-keymap-select zle-line-init )

for zle_widget in $zle_widgets; do
	zle -N "$zle_widget"
done

# Keybindings

bindkey -v

# Local configuration

src "$HOME/.local.sh"
src "$HOME/.local.zsh"

# Cleanup

unset autoload_function autoload_functions zle_widget zle_widgets
unset -f src
