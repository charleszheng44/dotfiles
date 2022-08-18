" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')    

" language support
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'} 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" rust lang support
Plug 'rust-lang/rust.vim'
" vim tool
Plug 'itchyny/vim-gitbranch'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
" colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'embark-theme/vim', {'as': 'embark'}
Plug 'edkolev/tmuxline.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'EdenEast/nightfox.nvim'
Plug 'haishanh/night-owl.vim'
" fzf fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
" plantuml preview
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'ryanoasis/vim-devicons'

call plug#end()
