" Make sure that vimrc isn't overridden by anything.
" (i.e. stop livin' in the past)
" Indent based on file type.
" Highlight syntax.
set nocompatible
filetype indent plugin on
syntax on

" some stuff im trying out
set background=dark
set smarttab
set expandtab
" set softtabstop=4
set shiftwidth=4
set tabstop=4
set scrolloff=1
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set incsearch
set t_Co=256
set cursorline
set inccommand=nosplit

set spelllang=en

" Allow opening new files without being forced to save
set hidden 

" command line completion, + show partial commands
set wildmenu 
set showcmd

" highlight search
set hlsearch

" BACKSPACE OVER EVERYTHING, FREEEDOOOOOOM
set backspace=indent,eol,start


" copy the indent of the last line if no other indent rules exist
set autoindent

" ask to exit rather than demanding a new command
set confirm

" those little numbers that tell you where in the file you are
set ruler

" Always display the status line, which tells you what files are open
set laststatus=2

" Show line numbers on the side
set number

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

" Journalling
nnoremap <leader>dd :e ~/docs/diary/<CR>
nnoremap <leader>d<leader>d :Goyo<CR>:e ~/docs/diary/`date +\%Y-\%m-\%d`.wiki.md<CR>
nnoremap <leader>d<leader>i :r!ls ~/docs/diary/<CR>

" open todo.txt file
nnoremap <leader>td :e ~/docs/todo/todo.txt<CR>

" highlight tabs and trailing whitespace
nnoremap <leader><space> /	\\|\s$<CR>

" rainbow csv settings
let g:rb_storage_dir = $XDG_CACHE_HOME . '/rainbow_csv'
let g:table_names_settings = $XDG_CACHE_HOME . '/rbql_table_names'
let g:rainbow_table_index = $XDG_CACHE_HOME . '/rbql_table_index'

" Jellybeans.vim personal settings
let g:jellybeans_use_lowcolor_black = 1
let g:jellybeans_overrides = {
            \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
            \}
    if has('termguicolors') && &termguicolors
            let g:jellybeans_overrides['background']['guibg'] = 'none'
        endif
colorscheme jellybeans
