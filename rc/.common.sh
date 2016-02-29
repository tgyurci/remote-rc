# ~tgyurci/.common.sh

# environment variables

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
		PATH="$PATH:$HOME/bin"
	fi

	export PATH
fi

export BLOCKSIZE="K"
export EDITOR="vim"
export LESS="-QMiR -x4"
export LESSHISTFILE=-
export PAGER="less"
export VISUAL="$EDITOR"
export XMLLINT_INDENT="	" # tab
if [ -f "$HOME/.inputrc" ]; then
	export INPUTRC="$HOME/.inputrc"
fi

# common aliases

alias df='df -h'
alias diff='diff -u'
alias du='du -h'
alias v='$EDITOR -'
alias ls='ls -Fa'
alias p='$PAGER'

# OS-specific settings

case "$UNAME_S" in
	Darwin)
		alias df='df -hi'
		alias ldd='otool -L'
		alias ls='ls -FaGO'
		alias top='top -s 1 -o cpu'
		EDITOR=/usr/bin/vim
	;;
	DragonFly)
		alias df='df -hi'
		alias fetch='fetch -vr'
		alias ls='ls -FaGo'
		alias top='top -s 1 -o cpu'
	;;
	FreeBSD)
		alias df='df -hi'
		alias fetch='fetch -vr'
		alias ls='ls -FaGo'
		alias top='top -s 1 -o cpu'
	;;
	Linux)
		alias df='df -h'
		alias free='free -lt'
		alias ls='ls -Fa --color=auto'
		alias pstree='pstree -aclpSu'
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
	;;
esac
