" Vundle Settings
" ---------------
" vundle is the VIM plugin-manager

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins Start ---->

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim' " Auto-completion

" <---- End Plugins

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" General Settings
" ----------------
" These settings Apply to vanilla VIM

syntax enable
filetype plugin on
setlocal cm=blowfish2

set autoindent
set smartindent
" set number
" set cursorline
set modeline
set expandtab
set wrap
set linebreak
set ruler
set showmatch " highlights matching braces
set visualbell
set t_vb=
set wildmenu " auto-complete for commands
set incsearch " search as characters are entered
set hlsearch " highlight matches
set lazyredraw " reduces frequency with which VIM redraws needlessly
set encoding=utf-8 " Make sure we're always using utf8

set ls=2
set tabstop=2
set shiftwidth=2
set textwidth=0
set foldlevel=99
set backspace=indent,eol,start
set fdm=indent
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set laststatus=2 " Always show last status

set statusline=%t\ %m%r%y%=%l/%L\ %c\ %P


" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red
match BadWhitespace /\s\+\%#\@<!$/

au BufNewFile,BufRead *.sls set ft=yaml
au BufNewFile,BufRead *.play set ft=yaml
au BufNewFile,BufRead *.task set ft=yaml
au BufNewFile,BufRead *-vault set ft=yaml
au BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufRead *.json set ft=javascript

" Python specific, to satisfy pep8
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" Plugin Specific Settings
" ------------------------

