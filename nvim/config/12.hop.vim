lua <<EOF
require'hop'.setup()
EOF

nnoremap <C-a> :HopWord<CR>
nnoremap <C-s> :HopLine<CR>
