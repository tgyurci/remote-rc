# ~tgyurci/.profile

# TODO execute ~/.local.sh if it exists and shell is interactive
if [ -f "$HOME/.common.sh" ]; then
	export UNAME_S="$(uname -s)"
	export ENV="$HOME/.common.sh"
fi
