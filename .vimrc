filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set number
" when you start searching text with /, search is performed at every new character insertion
set incsearch
set nopaste
set autoindent
" set fileformats=unix,dos
" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
syntax on
" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
" fix syntax with Ctrl + K
autocmd FileType php noremap <C-K> :!php-cs-fixer fix %<CR>
