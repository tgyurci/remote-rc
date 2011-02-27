" ~tgyurci/.vimrc

set nocompatible
set viminfo=
set visualbell
set t_vb=
set backspace=start,eol,indent
set tabstop=4
set shiftwidth=4
set nowrap
set ruler
set showmode
set showcmd
set wildmenu
set shortmess+=I
set showbreak=>
set ignorecase
set smartcase
set noincsearch
set nohlsearch
set grepprg=ack\ -a
set background&
set nomodeline
set noshowmatch
set noautoindent
syntax on
colorscheme default

" included apache configs
autocmd BufNewFile,BufRead /*/etc/apache*/**/*.conf setlocal filetype=apache

" BSD rc scripts
autocmd BufRead /etc/rc.* setlocal filetype=sh

" BSD network functions for rc
autocmd BufRead /etc/network.subr setlocal filetype=sh

" BSD periodic scripts
autocmd BufRead /etc/periodic/** setlocal filetype=sh tabstop=8

" BSD periodic conf
autocmd BufRead /etc/periodic.conf setlocal filetype=sh

" default C include headers
autocmd BufRead /user/include/** setlocal tabstop=8

" Java sources in BSD's diablo JDK
autocmd BufRead /usr/local/diablo-jdk16/src/** setlocal tabstop=8

" mod_python directives
autocmd FileType apache syntax keyword apacheDeclaration PythonPath PythonHandler PythonInterpreter PythonOption

" mod_dav_svn directives
autocmd FileType apache syntax keyword apacheDeclaration SVNPath SVNParentPath

" default indenter for xml files
autocmd FileType xml setlocal equalprg=xmllint\ --format\ -

" FreeBSD loader config
autocmd BufRead *.4th setfiletype forth

filetype indent on
filetype plugin indent off

let s:local_vimrc = $HOME."/.vimrc.local"
if filereadable(s:local_vimrc)
	source $HOME/.vimrc.local
endif
