require("nvim-tree").setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
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
vim.cmd[[autocmd Colorscheme * highlight NvimTreeNormal guibg=#1b1c1c]]
