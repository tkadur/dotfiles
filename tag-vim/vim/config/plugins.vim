scriptencoding utf-8

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
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Appearance/layout plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  " Always show statusbar
  set laststatus=2
  " Fancy arrow symbols, requires a patched font
  let g:airline_powerline_fonts = 0
  " Show PASTE if in paste mode
  let g:airline_detect_paste=1
  " Show airline for tabs too
  let g:airline#extensions#tabline#enabled = 1
  " Use theme for the Airline status bar
  let g:airline_theme='onedark'
Plug 'mhinz/vim-startify'

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'jez/vim-better-sml'
  au Filetype sml setlocal conceallevel=2
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc-syntax'
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" General convenience plugins
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'

" Vim/Neovim compatibility
if (!has('nvim')) && v:version >= 800
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Syntax/completion plugins
if has('nvim') || v:version >= 800
  Plug 'w0rp/ale'
    " We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
    hi clear SignColumn

    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '▲'
    let g:ale_set_loclist=0
    let g:ale_set_quickfix=1
    let g:ale_open_list = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_run_on_insert_leave = 1

    let g:ale_linters = {
          \   'c' : ['clangtidy'],
          \   'cpp' : ['clangtidy']
          \ }

    let g:ale_fixers = {
          \   'c' : ['clang-format'],
          \   'cpp' : ['clang-format']
          \ }

    " Don't report refactor or convention errors
    let g:ale_python_pylint_options = '--disable=R,C,I,F'

    let g:airline#extensions#ale#enabled = 1
elseif v:version < 800
  Plug 'vim-syntastic/syntastic'
    " We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
    hi clear SignColumn

    let g:syntastic_error_symbol = '✘'
    let g:syntastic_warning_symbol =  '▲'

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:airline#extensions#syntastic#enabled = 1
endif

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  "Open NERDTree when Vim is launched on a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " Close NERDTree if it's the last buffer open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:NERDTreeQuitOnOpen = 0

" Misc plugins
Plug 'wesQ3/vim-windowswap'
  let g:airline#extensions#windowswap#enabled = 1

call plug#end()

" Colors (must be set after vim-plug loads themes)
colorscheme onedark
" set background=dark
