local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files)
vim.keymap.set('n', '<leader>a', builtin.live_grep)
vim.keymap.set('n', ';', builtin.buffers)
