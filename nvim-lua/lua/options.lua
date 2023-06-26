-- show matching brackets.	
vim.opt.showmatch = true
-- case insensitive matching	
vim.opt.ignorecase = true
-- smart case matching
vim.opt.smartcase = true
-- incremental search
vim.opt.incsearch = true
-- save before commands like :next and :make
vim.opt.autowrite = true
-- hide buffers when they are abandoned
vim.opt.hidden = true
-- show line number
vim.opt.number = true
-- highlight the current line
vim.opt.cursorline = true
-- highlight search
vim.opt.hlsearch = true
-- set up tab behavior
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- unformat paste
vim.opt.pastetoggle = '<F2>'

vim.opt.background = 'dark'
vim.opt.termguicolors = true
-- colorscheme oxocarbon
vim.cmd[[highlight Normal ctermbg=NONE]]
vim.cmd[[highlight Comment cterm=italic gui=italic]]

-- set buffer size large enough
vim.opt.maxmempattern = 3000000

-- fold function by syntax
vim.opt.foldmethod = "syntax"
-- don't fold when open a new file
vim.opt.foldlevelstart = 20

-- enable mouse
vim.opt.mouse = 'a'

-- a highlight on 80 character
vim.opt.colorcolumn = '80'

-- set the height of the comand prompt window to 1
vim.opt.cmdheight = 1

-- copy to system clipboard
vim.opt.clipboard = 'unnamedplus'
