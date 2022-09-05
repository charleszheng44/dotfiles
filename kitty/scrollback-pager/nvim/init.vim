set nonumber 
set mouse=a
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'wl-copy',
      \      '*': 'wl-copy',
      \    },
      \   'paste': {
      \      '+': 'wl-paste -o',
      \      '*': 'wl-paste -o',
      \   },
      \   'cache_enabled': 0,
      \ }
set clipboard+=unnamedplus
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
