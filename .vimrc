" Vundle Settings
" ---------------
" vundle is the VIM plugin-manager

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins Start ---->

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim' " Auto-completion, Refactoring
Plugin 'preservim/nerdtree' " Directory tree
Plugin 'mechatroner/rainbow_csv' " CSV Colors + RBQL

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
set path+=** " Alloy Vim to recursively search all child directories

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red
match BadWhitespace /\s\+\%#\@<!$/

au BufNewFile,BufRead *.sls set ft=yaml
au BufNewFile,BufRead *.play set ft=yaml
au BufNewFile,BufRead *.task set ft=yaml
au BufNewFile,BufRead *-vault set ft=yaml
au BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.conf set ft=config
au BufNewFile,BufRead *.config set ft=config
au BufNewFile,BufRead *.ini set ft=config
au BufNewFile,BufRead *.toml set ft=config

" Python specific, to satisfy pep8
au Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

" Plugin Specific Settings
" ------------------------

