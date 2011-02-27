# ~tgyurci/.common.sh

if [ -z "$PATH" ]; then
	PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
fi
EDITOR=vim

# OS-specific settings

case "${UNAME_S}" in
	Darwin)
		alias ls='ls -FaGO'
		alias top='top -s 1 -o cpu'
		alias ldd='otool -L'
		PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin
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
	OpenBSD)
		alias ls='ls -Fao'
		alias top='top -s 1 -o cpu'
	;;
	*)
		alias ls='ls -Fa'
	;;
esac

# environment variables

if [ -d "$HOME/bin" ]; then
	PATH=$HOME/bin:$PATH
fi

export PATH
export BLOCKSIZE=K
export PAGER=less
export EDITOR
export VISUAL="$EDITOR"
export LESS="-QMi -x4"
export LESSHISTFILE=-
export XMLLINT_INDENT="	" # tab
if [ -f "$HOME/.inputrc" ]; then
	export INPUTRC="$HOME/.inputrc"
fi

# aliases

alias df='df -h'
alias du='du -h'
if [ -z "$DIFF_OPTIONS" ]; then
	alias diff='diff -u'
fi
