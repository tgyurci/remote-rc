# ~tgyurci/.common.sh

if [ -z "$PATH" ]; then
	PATH=/sbin:/bin:/usr/sbin:/usr/bin

	if [ -d /usr/local ]; then
		PATH="$PATH:/usr/local/sbin:/usr/local/bin"
	fi

	if [ -d /usr/pkg ]; then
		PATH="$PATH:/usr/pkg/sbin:/usr/pkg/bin"
	fi

	if [ -d /opt/local ]; then
		PATH="$PATH:/opt/local/sbin:/opt/local/bin"
	fi

	if [ -d "$HOME/bin" ]; then
		PATH="$HOME/bin:$PATH"
	fi

	export PATH
fi
EDITOR="vim"

# OS-specific settings

case "$UNAME_S" in
	Darwin)
		alias df='df -hi'
		alias ls='ls -FaGO'
		alias top='top -s 1 -o cpu'
		alias ldd='otool -L'
		EDITOR=/usr/bin/vim
	;;
	DragonFly)
		alias df='df -hi'
		alias ls='ls -FaGo'
		alias top='top -s 1 -o cpu'
		alias fetch='fetch -vr'
	;;
	FreeBSD)
		alias df='df -hi'
		alias ls='ls -FaGo'
		alias top='top -s 1 -o cpu'
		alias fetch='fetch -vr'
	;;
	Linux)
		alias df='df -h'
		alias ls='ls -Fa --color=auto'
		alias top='top -d 1'
	;;
	NetBSD)
		alias df='df -hi'
		alias ls='ls -Fao'
		alias top='top -s 1 -o cpu'
	;;
	OpenBSD)
		alias df='df -hi'
		if [ -x /usr/local/bin/colorls ]; then
			alias ls='colorls -FaGo'
		else
			alias ls='ls -Fao'
		fi
		alias top='top -s 1 -o cpu'
	;;
	SunOS)
		alias ls='ls -Fa --color=auto'
		alias top='top -s 1 -o cpu'
	;;
	*)
		alias df='df -h'
		alias ls='ls -Fa'
	;;
esac

# aliases

alias du='du -h'
alias diff='diff -u'

# environment variables

export BLOCKSIZE="K"
export PAGER="less"
export EDITOR
export VISUAL="$EDITOR"
export LESS="-QMiR -x4"
export LESSHISTFILE=-
export XMLLINT_INDENT="	" # tab
if [ -f "$HOME/.inputrc" ]; then
	export INPUTRC="$HOME/.inputrc"
fi
