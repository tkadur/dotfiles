set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins go here

" Color scheme plugins
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Appearance/layout plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'jez/vim-better-sml'
Plug 'jez/vim-c0'

" General convenience plugins
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Kazark/vim-SimpleSmoothScroll'
Plug 'vim-scripts/a.vim'
Plug 'mbbill/undotree'

" Tag plugins
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

if has("nvim")
    " Syntax/completion plugins
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/neoinclude.vim'
    Plug 'zchee/deoplete-clang'
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'zchee/deoplete-asm'
endif

" Misc plugins
Plug 'jez/vim-superman'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

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
set colorcolumn=81     " show a column whenever textwidth is set
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

" Show potential matches above completion, complete first immediately
set wildmenu
set wildmode=full

"Enable filetype detection and syntax highlighting

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

colorscheme gruvbox
set background=dark

" Show multicharacter commands as they are being typed
set showcmd

" Spaces masterrace
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

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

" Better split navigation scheme
nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-i> <C-w>k
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" Common keyboard shortcuts
noremap <C-f> /
inoremap <C-o> <esc>:FZF<CR>
nnoremap <C-o> :FZF<CR>
inoremap <C-u> <esc>:UndotreeToggle<CR>
nnoremap <C-u> :UndotreeToggle<CR>
inoremap <C-a> <esc>ggVG
nnoremap <C-a> ggVG

" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

if has("autocmd")
  " Jump to the last known cursor position when opening a file.
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Automatically remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e
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

" Hit ctrl+n to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Hit ctrl+s to save
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<CR>

" Hit ctrl+q to quit
inoremap <C-q> <esc>:q<CR>
nnoremap <C-q> :q<CR>

" Change undo/redo commands
nnoremap <S-u> u
nnoremap <S-r> <C-r>

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

if has("nvim")

    " ----- Shougo/deoplete.nvim settings -----

    let g:deoplete#enable_at_startup = 1

    "C/C++
    let g:deoplete#sources#clang#libclang_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
    let g:deoplete#sources#clang#clang_header = "/Library/Developer/CommandLineTools/usr/lib/clang"

    " Rust
    let g:deoplete#sources#rust#racer_binary='/Users/Thejas/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path='/Users/Thejas/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

    autocmd FileType tex let b:deoplete_disable_auto_complete = 1
    autocmd FileType sml let b:deoplete_disable_auto_complete = 1

    set completeopt+=noinsert

    " Auto close preview
    autocmd CompleteDone * silent! pclose!

    " ----- ervandew/supertab settings -----
    let g:SuperTabDefaultCompletionType = "<c-n>"


    " ----- w0rp/ale settings -----

    " We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
    hi clear SignColumn

    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '▲'
    let g:ale_open_list = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_run_on_insert_leave = 1

    let g:ale_linters = {
          \  'c': ['clang'],
          \  'cpp': ['clang'],
          \  'rust': ['rustc']
          \}

    " Don't report refactor or convention errors
    let g:ale_python_pylint_options = '--disable=R,C'
endif

" ----- jez/vim-superman settings -----
" better man page support
" noremap K :SuperMan <cword><CR>

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

" Use theme for the Airline status bar
let g:airline_theme='gruvbox'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- jez/vim-better-sml settings -----
au Filetype sml setlocal conceallevel=2

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./.tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <C-b> :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- Yggdroot/indentLine settings -----
 let g:indentLine_enabled = 0
