" No brainers.
set nocompatible
syntax on
set background=dark
set scrolloff=1
set incsearch " Honestly, every text editor should have something like this
set hlsearch

" Yes, really. See the Linux Kernel Style guide for rationale.
" I'm pretty sure the only reason why I liked ts=4 is because it was like
" Python, which I grew up on. I don't like Python so much anymore.
set tabstop=8
set shiftwidth=8
set noexpandtab
set autoindent " Be consistent.
filetype indent plugin on " Stay consistent with language standards.

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set cursorline

set spelllang=en

" bad habit. might interfere when I use more portable vi's.
set backspace=

" modern command line niceties
set wildmenu
set showcmd

" file orientation
set ruler
set number
set laststatus=2

" add a warning when you're at 80 characters
highlight ColorColumn ctermbg=blue

:function ToggleColorColumn()
:	if &colorcolumn != 80
:		setlocal colorcolumn=80
:	else
:		setlocal colorcolumn=0
:	endif
:	echo "Column Toggled."
:endfunction

noremap <leader>cc :call ToggleColorColumn()<CR>

" open todo.txt file
nnoremap <leader>td :e ~/docs/todo/todo.txt<CR>

" highlight tabs and trailing whitespace
nnoremap <leader><space> /	\\|\s$<CR>

" Convert to hex using xxd (not included in neovim)
nnoremap <leader>hexd :set binary<CR>:%!xxd<CR>:set nobinary<CR>:echo "xxd: Dumped Hex."<CR>
nnoremap <leader>hexr :%!xxd -r<CR>:set binary<CR>:echo "xxd -r: Reverted to binary."<CR>

" rainbow csv settings
let g:rb_storage_dir = $XDG_CACHE_HOME . '/rainbow_csv'
let g:table_names_settings = $XDG_CACHE_HOME . '/rbql_table_names'
let g:rainbow_table_index = $XDG_CACHE_HOME . '/rbql_table_index'

" some frils (TODO: actually... publish this colour scheme)
" let g:nofrils_strbackgrounds = 1
colorscheme lowfrils-dark
