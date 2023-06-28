local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files)
vim.keymap.set('n', '<leader>a', builtin.live_grep)
vim.keymap.set('n', ';', builtin.buffers)
if (vim.g.colors_name == 'oxocarbon') then
    vim.api.nvim_set_hl(0, "TelescopeBorder", {ctermbg=220})
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {fg='#393939', bg='#08bdba'})
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg='#fafafa', bg='#161616'})
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg='#fafafa', bg='#161616'})
end

require('telescope').setup {
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
        horizontal = {
            prompt_position="top",
        },
    },
  },
}
