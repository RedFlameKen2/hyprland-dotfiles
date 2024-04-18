set nocompatible

filetype off


syntax on

filetype plugin indent on

set shiftwidth=4
set softtabstop=4

set number

set termguicolors


set ai
set si

set encoding=utf-8
set fileencoding=utf-8

map <C-BS> <C-w>

au BufNewFile,BufRead,BufReadPost .aliases set syntax=sh
au BufNewFile,BufRead,BufReadPost *.rasi set syntax=css

augroup auto_colorize
  autocmd!
  autocmd
        \ BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew
        \ *.js,*.css,*.scss,*.sass,*.ini,*.rofi
        \ ColorHighlight
augroup END
