require('nvim-treesitter').setup()

local parsers = {
    'bash', 'c', 'cpp', 'go', 'json', 'lua', 'markdown', 'markdown_inline',
    'python', 'rust', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
}
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        if vim.bo[args.buf].filetype == 'php' then
            return
        end
        pcall(vim.treesitter.start, args.buf)
    end,
})

require('nvim-treesitter-textobjects').setup({
    move = { set_jumps = true },
})

local move = require('nvim-treesitter-textobjects.move')
local function map(lhs, fn)
    vim.keymap.set({ 'n', 'x', 'o' }, lhs, fn)
end
map(']m', function() move.goto_next_start('@function.outer', 'textobjects') end)
map(']M', function() move.goto_next_end('@function.outer', 'textobjects') end)
map('[m', function() move.goto_previous_start('@function.outer', 'textobjects') end)
map('[M', function() move.goto_previous_end('@function.outer', 'textobjects') end)
