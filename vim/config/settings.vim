set nocompatible

filetype plugin indent on " attempt to determine file type
syntax on                 " enable syntax highlighting

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set encoding=utf-8
set history=1000               " keep 1000 lines of command line history
set number                     " line numbers
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
" set linebreak                  " wrap lines on 'word' boundaries
" set scrolloff=3                " don't let the cursor touch the edge of the viewport
set splitright                 " Vertical splits  use   right half  of screen
set splitbelow                 " Horizontal splits  use  bottom half  of screen
set timeoutlen=1000            " Lower ^[ timeout
set fillchars=fold:\ ,         " get rid of obnoxious '-' characters in folds
set tildeop                    " use ~ to toggle case as an operator, not a motion
set colorcolumn=81             " show a column whenever textwidth is set
" set clipboard=unnamedplus                           " use system keyboard
set hidden                     " buffer becomes hidden when it is abandoned
set wildmenu                   " visual autocomplete for command menu
set wildmode=full              " complete first match immediately
set lazyredraw                 " only redraw when necessary
set ttyfast                    " always assume a fast terminal
set showmatch                  " show matching brackets
set report=0                   " always report changed lines
set path+=**                   " recursively find files
if exists('&breakindent')
  set breakindent              " Indent wrapped lines up to the same level
endif
"
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" This lets us use 24-bit "true" colors in the terminal
if exists('+termguicolors')
  set termguicolors
endif

" Spaces masterrace
set tabstop=2     " number of visual spaces per tab
set softtabstop=2 " number of spaces per tab when editing
set shiftwidth=0  " number of spaces for each step of autoindent
set expandtab     " tabs are spaces
set shiftround    " round to multiple of shiftwidth when adjusting indentation
set autoindent    " auto indent on a new line


" Incremental search
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
set ignorecase " ignore case when searching lowercase
set smartcase  " don't ignore case when inserting uppercase characters

" Persistent undo
set undofile
set undodir=~/.vim/undodir

" Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

if has("autocmd")
  " Jump to the last known cursor position when opening a file.
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Automatically remove trailing whitespace
  au BufWritePre * :%s/\s\+$//e

  " Automatically close loclist when no files open
  au WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif
endif


" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
