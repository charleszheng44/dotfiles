-- Enable Copilot for specific filetypes
vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = true,
    ["rust"] = true,
    ["go"] = true,
    ["python"] = true,
    ["java"] = true,
    ["json"] = true,
    ["yaml"] = true,
    ["sh"] = true,
}

-- Disable Copilot for large files
vim.g.copilot_assume_mapped = true

-- Key mappings for Copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.keymap.set('i', '<C-K>', '<Plug>(copilot-dismiss)')
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-H>', '<Plug>(copilot-previous)')