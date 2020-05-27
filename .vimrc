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

set spelllang=en

let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" another file, where they're 'hidden'. In more technical terms, you can
" re-use the same window while having an unsaved 'hidden' buffer.
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
:endfunction

noremap <leader>cc :call ToggleColorColumn()<CR>
" call matchadd('ColorColumn','\%81v',80)
