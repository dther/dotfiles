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
set softtabstop=4
set shiftwidth=4
set tabstop=4
set scrolloff=1
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set incsearch

set spelllang=en

" TODO: make this work in tmux!
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" Allow opening new files without being forced to save
set hidden 

" command line completion, + show partial commands
set wildmenu 
set showcmd

" highlight search
set hlsearch

"remove highlights
noremap <leader>hl :nohlsearch<CR>

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

" Show relative line numbers on the side
set relativenumber
set number

" unbind arrowkeys to encourage good practice
noremap <Up> :echo "Use HJKL!"<CR>
noremap <Down> :echo "Use HJKL!"<CR>
noremap <Left> :echo "Use HJKL!"<CR>
noremap <Right> :echo "Use HJKL!"<CR>

" add a warning when you're over 80 lines
highlight ColorColumn ctermbg=blue

:function ToggleColorColumn()
:   if &colorcolumn != 80
:       setlocal colorcolumn=80
:   else
:       setlocal colorcolumn=0
:   endif
:   echo "Column Toggled."
:endfunction

noremap <leader>cc :call ToggleColorColumn()<CR>

" vimwiki replacement!
nnoremap <leader>nn :e ~/docs/notes/index.md<CR>
" TODO: make a function that gets the word under cursor and use that as title
nnoremap <leader>n<leader>n :e ~/docs/notes/
nnoremap <leader>n<leader>i :r!ls ~/docs/notes/<CR>

nnoremap <leader>dd :e ~/docs/diary/index.md<CR>
nnoremap <leader>d<leader>d :e ~/docs/diary/`date +\%Y-\%m-\%d`.md<CR>
nnoremap <leader>d<leader>i :r!ls ~/docs/diary/<CR>

" open todo.txt file
nnoremap <leader>td :e ~/docs/todo/todo.txt<CR>

" PLUGIN STUFF

" Prerequisites: goyo.vim and limelight.vim
noremap <leader>G :Goyo<CR>
autocmd! User GoyoEnter Limelight | set lbr
autocmd! User GoyoLeave Limelight! | set lbr!
autocmd! User GoyoLeave set background=dark
noremap <leader>l :Limelight!!<CR>
let g:limelight_conceal_ctermfg = 'DarkGrey'
