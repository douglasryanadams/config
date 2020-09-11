" Vundle Settings
" ---------------
" vundle is the VIM plugin-manager

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins Start ---->

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim' " Python Auto-completion, Refactoring
Plugin 'preservim/nerdtree' " Directory tree
Plugin 'mechatroner/rainbow_csv' " CSV Colors + RBQL
Plugin 'scrooloose/syntastic' " Syntactic Highlighting For Many Things
Plugin 'rust-lang/rust.vim' " Rust Support
Plugin 'cespare/vim-toml' " toml config syntax
Plugin 'chr4/nginx.vim' " Nginx Config Highlighting
Plugin 'hashivim/vim-terraform' " Terraform Syntax
Plugin 'juliosueiras/vim-terraform-completion' " Terraform Autocomplete

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

" Register Keys
nnoremap <F5> "=strftime("%Y-%m-%d %H:%M")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

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
au BufNewFile,BufRead Dockerfile* set ft=dockerfile
au BufNewFile,BufRead Vagrantfile set ft=ruby
au BufNewFile,BufRead *.toml set ft=config

" Python specific, to satisfy pep8
au Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

" Plugin Specific Settings
" ------------------------

" Terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_completion_keys=1
let g:terraform_registry_module_completion=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%#{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_log_list=1
let g:sytastic_check_on_open=1
let g:syntastic_check_on_wq=1
