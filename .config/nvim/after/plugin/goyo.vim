" Goyo specific
noremap <leader>G :Goyo<CR>
autocmd! User GoyoEnter Limelight | set lbr
autocmd! User GoyoLeave Limelight! | set lbr!
autocmd! User GoyoLeave set background=dark
