" Enable block cursor in normal mode and line cursor in insert mode
" mintty specific
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Disable escape timeous
" mintty specific
" let &t_ti.="\e[?7727h"
" let &t_te.="\e[?7727l"
" noremap <Esc>O[ <Esc>
" noremap! <Esc>O[ <C-c>
