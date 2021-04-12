# ~tgyurci/.zshenv

umask 022

if [[ -f "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.zshenv.local" ]]; then
	. "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.zshenv.local"
fi

if [[ -f "$HOME/.zshenv.local" ]]; then
	. "$HOME/.zshenv.local"
fi

if [[ -n "$ZDOTDIR" && -f "$ZDOTDIR/.zshenv.local" ]]; then
	. "$ZDOTDIR/.zshenv.local"
fi
