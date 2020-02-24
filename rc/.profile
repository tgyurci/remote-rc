# ~tgyurci/.profile

# Set ENV for interactive shells
if [ -f "$HOME/.shrc" ]; then
	export UNAME_S="$(uname -s)"
	export ENV="$HOME/.shrc"
fi

# Local configuration

if [ -f "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.profile.local" ]; then
	. "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.profile.local"
fi

if [ -f "$HOME/.profile.local" ]; then
	. "$HOME/.profile.local"
fi
