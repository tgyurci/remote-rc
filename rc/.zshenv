# ~tgyurci/.zshenv

umask 022
setopt NO_GLOBAL_RCS

if [[ -f "$HOME/.zshenv.local" ]]; then
	. "$HOME/.zshenv.local"
fi
