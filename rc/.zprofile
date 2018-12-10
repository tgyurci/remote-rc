# ~tgyurci/.zprofile

if [[ -f ~/.profile ]]; then
	emulate sh -c '. ~/.profile'
fi

if [[ -f ~/.zprofile.local ]]; then
	. ~/.zprofile.local
fi
