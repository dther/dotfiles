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

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
elseif exists('$DISPLAY')
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[1 q"
endif
" TODO: Figure out how to make this work in the tty!!!

" Allow opening new files without being forced to save
set hidden 

" basically fuzzy finder
" set path+=**

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
" set relativenumber
set number

" netrw stuffs
"let g:netrw_banner=0	" NO BANNER
let g:netrw_liststyle=3 " tree mode?

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

" vimwiki replacement!
" nnoremap <leader>nn :e ~/docs/notes/index.md<CR>
" nnoremap <leader>n<leader>n :execute "e" expand("~/docs/notes/<cfile>")<CR>
" nnoremap <leader>n<leader>i :r!ls ~/docs/notes/<CR>
" Will affect jump list binds. Consider using <C-i> or making this file
" specific...
" nnoremap <Tab> /[A-Za-z0-9-]*.md<CR>

nnoremap <leader>dd :e ~/docs/diary/<CR>
nnoremap <leader>d<leader>d :Goyo<CR>:e ~/docs/diary/`date +\%Y-\%m-\%d`.wiki.md<CR>
nnoremap <leader>d<leader>i :r!ls ~/docs/diary/<CR>

" open todo.txt file
nnoremap <leader>td :e ~/docs/todo/todo.txt<CR>

" super simple snippet system
inoremap <leader>html <ESC>:r ~/.vim/snippets/snip.html<CR> /<++><CR>ca<
inoremap <leader><leader> <leader>

" highlight tabs and trailing whitespace
nnoremap <leader><space> /	\\|\s$<CR>

" PLUGIN STUFF

" Prerequisites: goyo.vim and limelight.vim
noremap <leader>G :Goyo<CR>
autocmd! User GoyoEnter Limelight | set lbr
autocmd! User GoyoLeave Limelight! | set lbr!
autocmd! User GoyoLeave set background=dark
noremap <leader>l :Limelight!!<CR>
let g:limelight_conceal_ctermfg = 'DarkGrey'

" Prerequisites: Jellybeans.vim
let g:jellybeans_use_lowcolor_black = 1
let g:jellybeans_overrides = {
            \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
            \}
    if has('termguicolors') && &termguicolors
            let g:jellybeans_overrides['background']['guibg'] = 'none'
        endif
colorscheme jellybeans
