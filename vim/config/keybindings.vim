" Set leader to <Space>
let mapleader = "\<Space>"

" Better line navigation scheme
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Better split navigation scheme
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" Common keyboard shortcuts
noremap <C-f> /

" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

" Open undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Consistent undo/redo commands
nnoremap <S-u> u
nnoremap <S-r> <C-r>

" Disable middle click to paste
map <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>

nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>

inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
