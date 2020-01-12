syntax enable
filetype plugin on
setlocal cm=blowfish2

set autoindent
set smartindent
" set number
set modeline
set expandtab
set wrap
set linebreak
set ruler
set showmatch
set visualbell
set t_vb=

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
set laststatus=2

set statusline=%t\ %m%r%y%=%l/%L\ %c\ %P

highlight BadWhitespace ctermbg=red
match BadWhitespace /\s\+\%#\@<!$/

au BufNewFile,BufRead *.sls set ft=yaml
au BufNewFile,BufRead *.play set ft=yaml
au BufNewFile,BufRead *.task set ft=yaml
au BufNewFile,BufRead *-vault set ft=yaml
au BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufRead *.json set ft=javascript

