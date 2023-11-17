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

vim.cmd [[colorscheme gruvbox]]
-- vim.o.termguicolors = true
vim.o.background = "dark"

-- use the terminal background
-- vim.cmd [[hi Normal ctermbg=none guibg=none]]

-- set buffer size large enough
vim.opt.maxmempattern = 3000000

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
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

-- auto format before existing
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
