vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require("ibl").setup {
    scope = {
    	enabled = true,
    	show_end = true,
	show_start = true
    }
}
