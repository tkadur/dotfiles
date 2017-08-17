set nocompatible

" If there are any machine-specific tweaks for Vim, load them from the following file.
try
  runtime! config/plugin.vim
catch
  echo "No plugin support"
endtry

filetype plugin indent on " attempt to determine file type
syntax on                 " enable syntax highlighting


set backspace=indent,eol,start " allow backspacing over everything in insert mode
set encoding=utf-8
set history=1000               " keep 1000 lines of command line history
set number                     " line numbers
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set linebreak                  " wrap lines on 'word' boundaries
set scrolloff=3                " don't let the cursor touch the edge of the viewport
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
if exists('&breakindent')
  set breakindent              " Indent wrapped lines up to the same level
endif


" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

"Tabs? masterrace
set tabstop=2     " number of visual spaces per tab
" set softtabstop=2 " number of spaces per tab when editing
set shiftwidth=0  " number of spaces for each step of autoindent
" set expandtab     " tabs are spaces
set shiftround    " round to multiple of shiftwidth when adjusting indentation
set autoindent    " auto indent on a new line


" Incremental search
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
set ignorecase " ignore case when searching lowercase
set smartcase  " don't ignore case when inserting uppercase characters

if has("autocmd")
    " Jump to the last known cursor position when opening a file.
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Automatically remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e

    " Automatically close loclist when no files open
    autocmd WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

    " Automatically close deoplete preview window
    autocmd CompleteDone * silent! pclose!
endif

" Make these commonly mistyped commands still work
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Wqa wqa<bang>
command! -bang W w<bang>
command! -bang Q q<bang>
command! -bang Qa qa<bang>

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

" Persistent undo
set undofile
set undodir=~/.vim/undodir

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

try
  runtime! config/keybindings.vim
catch
  echo "No keybindings support"
endtry
