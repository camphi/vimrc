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

syntax enable                                                                                                            
" set background=dark
colorscheme atom-dark                                                                                                    
set t_CO=256

" Make backspace behave like every other editor.
set backspace=indent,eol,start
" The default leader is \, but a comma is much better.
let mapleader = ','
" Macvim-specific line-height.
set linespace=15

" Search                                                                                      
set hlsearch                                                                                                             
set incsearch


" Mapping
"Add simple highlight removal.                                                                                           
nmap <Leader><space> :nohlsearch<cr>

" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>

" fix syntax with Ctrl + K
autocmd FileType php noremap <C-K> :!php-cs-fixer fix %<CR>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Automatically write the file when switching buffers.
set autowriteall

"https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

