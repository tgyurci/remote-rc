# ~root/.cshrc

umask 22

#set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin)

if ($?prompt) then
	alias ls ls -FaGo
	alias df df -h
	alias du du -h
	alias top top -s 1 -o cpu

	#setenv EDITOR vim
	#setenv PAGER less
	#setenv BLOCKSIZE K

	set prompt = "%B%m%b:%B%c%b%# "
	set prompt2 = "%R?"
	set prompt3 = "CORRECT> %B%R%b (y|n|e)?"

	set autolist
	set autocorrect
	set autoexpand
	set complete = enhance
	#set correct = cmd
	set echo_style = both
	set filec
	set fignore = (.o)
	set history = 100
	set savehist = 100
	set histdup = prev
	#set mail = (/var/mail/$USER)
	set nobeep
	set rmstar

	if ($?tcsh) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
	bindkey -v

	set time = (8 "Time spent in user mode   (CPU seconds) : %Us\
Time spent in kernel mode (CPU seconds) : %Ss\
Total time                              : %Es\
CPU utilisation (percentage)            : %P\
Times the process was swapped           : %W\
Times of major page faults              : %F\
Times of minor page faults              : %R")

	if ($term == xterm || $term == rxvt) then
		alias precmd 'echo -n "\033]0;${HOST}:${PWD}\007"'
	else if ($term == screen) then
		alias precmd 'echo -n "\033_${HOST}:${PWD}\033\\"'
	endif

	if ($?DISPLAY && -f ~${USER}/.Xauthority) then
		setenv XAUTHORITY ~${USER}/.Xauthority
	endif
endif

# vi: set ft=tcsh
