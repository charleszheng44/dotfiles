-- <Tab> to next buffer, <Shift-Tab> to previous buffer
vim.keymap.set('n', '<Tab>', ':bnext<CR>:redraw<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>:redraw<CR>')

-- shortcuts for updating, exit, and save_exit  
vim.keymap.set('', '<Leader>w', ':update<CR>')
vim.keymap.set('', '<Leader>q', ':q<CR>')
vim.keymap.set('', '<Leader>x', ':x<CR>')

-- split pane 
vim.keymap.set('', '<Leader>v', ':vs<CR>')
vim.keymap.set('', '<Leader>s', ':sp<CR>')
