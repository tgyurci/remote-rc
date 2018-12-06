" ~tgyurci/.vimrc

" Options

"  1 important
set nocompatible
set pastetoggle=<F6>

"  2 moving around, searching and patterns
set noincsearch
set ignorecase
set smartcase

"  3 tags

"  4 displaying text
set nowrap
set showbreak=>
set listchars=eol:¶,tab:»\ ,space:·,extends:>,precedes:<,nbsp:¬

"  5 syntax, highlighting and spelling
set background&
set nohlsearch

"  6 multiple windows

"  7 multiple tab pages

"  8 terminal
set title

"  9 using the mouse

" 10 printing

" 11 messages and info
set shortmess+=mI
set showcmd
set showmode
set ruler
set visualbell
if exists('&belloff')
	set belloff=all
endif

" 12 selecting text

" 13 editing text
set backspace=indent,eol,start

" 14 tabs and indenting
set tabstop=4
set shiftwidth=4

" 15 folding

" 16 diff mode

" 17 mapping

" 18 reading and writing files
set nomodeline

" 19 the swap file
set updatetime=2000

" 20 command line editing
set wildmode=longest:full,full
set wildmenu

" 21 executing external commands

" 22 running make and jumping to errors
set grepprg=ag\ --vimgrep\ $*
set grepformat^=%f:%l:%c:%m

" 23 language specific
set keymap=magyar
set iminsert=0
set imsearch=-1

" 24 multi-byte characters

" 25 various
set viminfo=

" 99 terminal settings
"set t_Co=256
set t_vb=

if &term == "screen" || &term =~ "^screen-"
	set t_ts=_
	set t_fs=\
endif

" Variables

let g:netrw_dirhistmax=0

" Syntax highlighting

syntax enable
"colorscheme default

if &t_Co == 256
	highlight CursorLineNr cterm=bold
	highlight Statement ctermfg=3
endif

highlight CursorLine cterm=NONE ctermbg=LightGray
highlight ExtraWhiteSpace ctermbg=LightGray
highlight NonText ctermfg=Gray
highlight Special ctermfg=92
highlight SpecialKey ctermfg=Gray
highlight Title cterm=bold

" Filetype detection

filetype indent on
filetype plugin indent off

" Autocommands

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

let s:local_vimrc = $HOME."/.vimrc.local"
if filereadable(s:local_vimrc)
	source $HOME/.vimrc.local
endif
