# ~tgyurci/.zprofile

if [[ -f ~/.profile ]]; then
	emulate sh -c '. ~/.profile'
fi

if [[ -f "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.zprofile.local" ]]; then
	. "${XDG_CONFIG_HOME:-"$HOME/.config"}/rc-local/.zprofile.local"
fi

if [[ -f ~/.zprofile.local ]]; then
	. ~/.zprofile.local
fi
