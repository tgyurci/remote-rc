" ~tgyurci/.vimrc

set nocompatible
set nomodeline
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
set wildmode=longest:full,full
set shortmess+=I
set showbreak=>
set ignorecase
set smartcase
set noincsearch
set nohlsearch
set grepprg=ack\ -a
set background&
set pastetoggle=<F6>
set noautoindent
syntax on
colorscheme default

" BSD rc scripts
autocmd BufRead /etc/rc.* setlocal filetype=sh

" BSD network functions for rc
autocmd BufRead /etc/network.subr setlocal filetype=sh

" BSD periodic conf
autocmd BufRead /etc/periodic.conf setlocal filetype=sh

" BSD periodic scripts
autocmd BufRead /etc/periodic/** setlocal filetype=sh tabstop=8

" default C include headers
autocmd BufRead /user/include/** setlocal tabstop=8

" included apache configs
autocmd BufNewFile,BufRead /*/etc/apache*/**/*.conf setlocal filetype=apache

" mod_python directives
autocmd FileType apache syntax keyword apacheDeclaration PythonPath PythonHandler PythonInterpreter PythonOption

" mod_dav_svn directives
autocmd FileType apache syntax keyword apacheDeclaration SVNPath SVNParentPath

" default indenter for xml files
autocmd FileType xml setlocal equalprg=xmllint\ --format\ -

" FreeBSD loader config
autocmd BufRead *.4th setlocal filetype=forth

" Gradle files
autocmd BufNewFile,BufRead *.gradle setlocal filetype=groovy

filetype indent on
filetype plugin indent off

let g:netrw_dirhistmax=0

let s:local_vimrc = $HOME."/.vimrc.local"
if filereadable(s:local_vimrc)
	source $HOME/.vimrc.local
endif
