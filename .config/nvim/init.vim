" No brainers.
set nocompatible
syntax on
set background=dark
set scrolloff=1
set incsearch " Honestly, every text editor should have something like this
set hlsearch

" basic keybinds
"let mapleader = "\\" " default anyway
" <Space>'s special behaviour is a vim extension, and one I don't find
" particularly useful
let maplocalleader = " "

" clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" open todo.txt file
nnoremap <leader>td :e ~/docs/todo/todo.txt<CR>

" highlight tabs and trailing whitespace
nnoremap <leader><space> /	\\|\s$<CR>

" Convert to hex using xxd (not included in neovim)
nnoremap <leader>xd :set binary<CR>:%!xxd<CR>:set nobinary<CR>:echo "xxd: Dumped Hex."<CR>
nnoremap <leader>xr :%!xxd -r<CR>:set binary<CR>:echo "xxd -r: Reverted to binary."<CR>

" Whitespace
" Yes, really.
" ts=4 is equally arbitrary and encourages excessive nesting.
set tabstop=8
set shiftwidth=8
set noexpandtab
set autoindent
" More importantly, though: stay consistent with language standards.
filetype indent plugin on

" useful info
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set cursorline

" Useful for jumping + window management
set title

" Useful for writing
set spelllang=en
nnoremap <leader>s :setlocal spell!<CR>

" bad habit. interferes when I use more portable vi's.
set backspace=

" modern command line niceties
set wildmenu
set showcmd

" file orientation
set ruler
set number
set laststatus=2

" Line breaking
set lbr

" add a warning when at 80 characters
highlight ColorColumn ctermbg=gray
set colorcolumn=80

:function ToggleColorColumn()
:	if &colorcolumn != 80
:		setlocal colorcolumn=80
:	else
:		setlocal colorcolumn=0
:	endif
:	echo "Column Toggled."
:endfunction

nnoremap <leader>cc :call ToggleColorColumn()<CR>

" rainbow csv settings
let g:rb_storage_dir = $XDG_CACHE_HOME . '/rainbow_csv'
let g:table_names_settings = $XDG_CACHE_HOME . '/rbql_table_names'
let g:rainbow_table_index = $XDG_CACHE_HOME . '/rbql_table_index'

" some frils (TODO: actually... publish this colour scheme)
" TODO: have some kind of backup if this doesn't exist, I quite like
" colorscheme peachpuff
" let g:nofrils_strbackgrounds = 1
colorscheme lowfrils-dark
