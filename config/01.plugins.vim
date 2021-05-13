call plug#begin('~/.vim/plugged')

" language support
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" rust lang support
Plug 'rust-lang/rust.vim'
" vim tool
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
" colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'embark-theme/vim', {'as': 'embark'}
Plug 'edkolev/tmuxline.vim'
Plug 'cocopon/iceberg.vim'
" fzf fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
