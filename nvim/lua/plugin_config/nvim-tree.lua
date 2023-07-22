require("nvim-tree").setup {
    sort_by = "case_sensitive",
    view = {
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
}

vim.keymap.set('', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('', '<Leader>f', ':NvimTreeFindFile<CR>')
vim.keymap.set('', '<Leader>c', ':NvimTreeCollapse<CR>')
