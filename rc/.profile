# ~tgyurci/.profile

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# TODO execute ~/.local.sh if it exists and shell is interactive
if [ -f "$HOME/.common.sh" ]; then
	export UNAME_S="$(uname -s)"
	export ENV="$HOME/.common.sh"
fi
