syntax enable
filetype plugin on
setlocal cm=blowfish2

set autoindent
set smartindent
set number
set modeline
set expandtab
set wrap
set ruler

set ls=2
set tabstop=4
set shiftwidth=4
set textwidth=0
set foldlevel=99
set backspace=indent,eol,start
set fdm=indent
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set laststatus=2

au BufNewFile,BufRead *.sls set ft=yaml
au BufNewFile,BufRead *.play set ft=yaml
au BufNewFile,BufRead *.task set ft=yaml
au BufNewFile,BufRead *-vault set ft=yaml
au BufNewFile,BufRead *.json set ft=javascript

