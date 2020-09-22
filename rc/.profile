# ~tgyurci/.profile

# Set ENV for interactive shells
if [ -f "$HOME/.shrc" ]; then
	UNAME_S="$(uname -s)"; export UNAME_S
	ENV="$HOME/.shrc"; export ENV
fi

# Local configuration

if [ -f "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.profile.local" ]; then
	. "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.profile.local"
fi

if [ -f "$HOME/.profile.local" ]; then
	. "$HOME/.profile.local"
fi
