let g:black_linelength = 80
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
