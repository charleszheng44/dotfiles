
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor 

" detect filetype
filetype plugin indent on 

" enable syntax
syntax on

" jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Show (partial) command in status line.
set showcmd	
" Show matching brackets.	
set showmatch
" Do case insensitive matching	
set ignorecase
" Do smart case matching
set smartcase		
" Incremental search
set incsearch
" Automatically save before commands like :next and :make
set autowrite
" Hide buffers when they are abandoned
set hidden
" show line number
set number
" highlight the current line
set cursorline
" mv swap to this file
set backupdir=~/tmp
" set up markdown syntax highlighting 
au BufRead,BufNewFile *.md set filetype=markdown
" highlight search
set hlsearch
" set up tab behavior
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" set status line
set laststatus=2
" unformat paste
set pastetoggle=<F2>

" set colorscheme
syntax enable
set background=dark
set termguicolors 
colorscheme nord
highlight Normal ctermbg=NONE
highlight Comment cterm=italic gui=italic

" Set buffer size large enough
set maxmempattern=3000000

" <Tab> to next buffer, <Shift-Tab> to previous buffer
nnoremap <Tab> :bnext<CR>:redraw<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>

" shortcuts for updating, exit, and save_exit  
noremap <Leader>w :update<CR>
noremap <Leader>q :q<CR>
noremap <Leader>x :x<CR>

" shortcuts for closeing buffer
noremap <Leader>b :BW<CR>
noremap <Leader>d :BD<CR>

" split pane 
noremap <Leader>v :vs<CR>
noremap <Leader>s :sp<CR>

" vim-go shortcut
noremap <Leader>gb :GoBuild<CR>

" fold function by syntax
set foldmethod=syntax
" don't fold when open a new file
set foldlevelstart=20

" enable mouse
set mouse=a

" a highlight on 80 character
set colorcolumn=80

" set the height of the comand prompt window to 1
set cmdheight=1

" copy to system clipboard
set clipboard=unnamedplus

" syntax highlight for vagrant file
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" setup the lsp
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = false,
        virtual_text = false,
        update_in_insert = false
    }
)
EOF
