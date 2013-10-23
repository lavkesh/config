set autoread
"color darkblue
set ic!
set title
set number
set nocompatible
set scrolloff=3
set autowriteall
set hlsearch incsearch
set softtabstop=4
set shiftwidth=4
set cindent ruler fo=cql fileformat=unix
set smartindent
set clipboard=unnamedplus
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
augroup filetypedetect 
   au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END
nnoremap <CR> :noh<CR><CR>
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
