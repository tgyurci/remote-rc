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
fi
EDITOR=vim

# OS-specific settings

case "$UNAME_S" in
	Darwin)
		alias ls='ls -FaGO'
		alias top='top -s 1 -o cpu'
		alias ldd='otool -L'
		EDITOR=/usr/bin/vim
	;;
	DragonFly)
		alias ls='ls -FaGo'
		alias top='top -s 1 -o cpu'
		alias fetch='fetch -vr'
	;;
	FreeBSD)
		alias ls='ls -FaGo'
		alias top='top -s 1 -o cpu'
		alias fetch='fetch -vr'
		export DIFF_OPTIONS=-u
	;;
	Linux)
		alias ls='ls -Fa --color=auto'
		alias top='top -d 1'
	;;
	NetBSD)
		alias ls='ls -Fao'
		alias top='top -s 1 -o cpu'
	;;
	OpenBSD)
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
		alias ls='ls -Fa'
	;;
esac

# aliases

alias df='df -h'
alias du='du -h'
if [ -z "$DIFF_OPTIONS" ]; then
	alias diff='diff -u'
fi

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

export PATH
