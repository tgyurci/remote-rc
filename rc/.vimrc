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
set title

if &term == "screen" || &term =~ "^screen-"
	set t_ts=_
	set t_fs=\
endif

syntax on
colorscheme default

if &t_Co == 256
	highlight CursorLineNr cterm=bold
	highlight Statement ctermfg=3
endif

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

" default indenter for JSON files
autocmd FileType json setlocal equalprg=jq\ -M\ .

" FreeBSD loader config
autocmd BufRead *.4th setlocal filetype=forth

" Gradle files
autocmd BufNewFile,BufRead *.gradle setlocal filetype=groovy

" Local .gitconfig
autocmd BufNewFile,BufRead ~/.gitconfig.local setlocal filetype=gitconfig

" Local .tmux.conf
autocmd BufNewFile,BufRead ~/.tmux.conf.local setlocal filetype=tmux

" Start insert mode in Command-line window
autocmd CmdwinEnter * startinsert

filetype indent on
filetype plugin indent off

let g:netrw_dirhistmax=0

let s:local_vimrc = $HOME."/.vimrc.local"
if filereadable(s:local_vimrc)
	source $HOME/.vimrc.local
endif
