set nonumber 
set mouse=a
set clipboard=unnamedplus
set virtualedit=all

call plug#begin('~/.config/kitty/scrollback-pager/nvim/plugged')    
Plug 'phaazon/hop.nvim'
call plug#end()

lua <<EOF
require'hop'.setup()
EOF


nnoremap <C-a> :HopWord<CR>
nnoremap <C-s> :HopLine<CR>

nnoremap <C-c> :q!<cr>
runtime! plugin/**/*.vim
