" Ensure that we are in modern vim mode, not backwards-compatible vi mode
set nocompatible
set backspace=indent,eol,start
filetype off " required for Vundle plugin manager

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'jez/vim-superman'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jez/vim-better-sml'

call vundle#end()

set encoding=utf-8

set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=3        " don't let the cursor touch the edge of the viewport
set splitright         "   Vertical splits  use   right half  of screen
set splitbelow         " Horizontal splits  use  bottom half  of screen
set timeoutlen=1000    " Lower ^[ timeout
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion
set colorcolumn=+0     " show a column whenever textwidth is set
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

" Show potential matches above completion, complete first immediately
set wildmenu
set wildmode=full

"Enable filetype detection and syntax hilighting

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

colorscheme base16-ocean
filetype on
filetype indent on
filetype plugin on

" Indent as intelligently as vim knows how
set smartindent

" Show multicharacter commands as they are being typed
set showcmd

" Spaces masterrace
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" Better line navigation scheme
noremap j h
noremap ; l
noremap <silent> k gj
noremap <silent> l gk
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

" Incremental search
set incsearch

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Smart case-sensitivity
set ignorecase
set smartcase

nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-i> <C-w>k

" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

" take first suggested spelling as correct spelling and replace
noremap <silent> z! z=1<CR><CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufWritePre * :%s/\s\+$//e
endif

" Make these commonly mistyped commands still work
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Wqa wqa<bang>
command! -bang W w<bang>
command! -bang Q q<bang>

" Force write readonly files using sudo
command! WS w !sudo tee %

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if exists('+termguicolors')
  " This lets us use 24-bit "true" colors in the terminal
  set termguicolors
endif

" Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" ----- Syntastic settings

" We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
hi clear SignColumn

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the base16 theme for the Airline status bar
let g:airline_theme='base16'

let g:airline#extensions#tabline#enabled = 1

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
