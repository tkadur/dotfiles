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

" Appearance/layout plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  " ----- bling/vim-airline settings -----

  " Always show statusbar
  set laststatus=2

  " Fancy arrow symbols, requires a patched font
  let g:airline_powerline_fonts = 1

  " Show PASTE if in paste mode
  let g:airline_detect_paste=1

  " Show airline for tabs too
  let g:airline#extensions#tabline#enabled = 1

  " Use theme for the Airline status bar
  let g:airline_theme='gruvbox'

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#ale#enabled = 1
Plug 'airblade/vim-gitgutter'
  " ----- airblade/vim-gitgutter settings -----
  " In vim-airline, only display "hunks" if the diff is non-zero
  let g:airline#extensions#hunks#non_zero_only = 1
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'jez/vim-better-sml'
  " ----- jez/vim-better-sml settings -----
  au Filetype sml setlocal conceallevel=2
Plug 'jez/vim-c0'

" General convenience plugins
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
  " ----- Raimondi/delimitMate settings -----
  let delimitMate_expand_cr = 1
  augroup mydelimitMate
      au!
      au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
      au FileType tex let b:delimitMate_quotes = ""
      au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
      au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'Kazark/vim-SimpleSmoothScroll'
Plug 'vim-scripts/a.vim'
Plug 'mbbill/undotree'

" Tag plugins
Plug 'ludovicchabant/vim-gutentags'

Plug 'majutsushi/tagbar'
  " ----- majutsushi/tagbar settings -----
  " Open/close tagbar with \b
  nmap <silent> <C-b> :TagbarToggle<CR>
  let g:tagbar_sort = 0
  " Uncomment to open tagbar automatically whenever possible
  "autocmd BufEnter * nested :call tagbar#autoopen(0)
  let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
          \'T:types,type definitions',
          \'f:functions,function definitions',
          \'g:enum,enumeration names',
          \'s:structure names',
          \'m:modules,module names',
          \'c:consts,static constants',
          \'t:traits,traits',
          \'i:impls,trait implementations',
      \]
      \}

" Syntax/completion plugins
if has("nvim") || v:version >= 800
    Plug 'w0rp/ale'
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
                  \  'rust': ['cargo']
                  \}
      " Don't report refactor or convention errors
      let g:ale_python_pylint_options = '--disable=R,C'
elseif has("nvim")
    Plug 'ervandew/supertab'
      " ----- ervandew/supertab settings -----
      let g:SuperTabDefaultCompletionType = "<c-n>"

    Plug 'Shougo/echodoc.vim'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/neoinclude.vim'
    Plug 'zchee/deoplete-clang'
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'zchee/deoplete-asm'
      " ----- Shougo/deoplete.nvim settings -----
      let g:deoplete#enable_at_startup = 1

      "C/C++
      let g:deoplete#sources#clang#libclang_path =
            \ "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
      let g:deoplete#sources#clang#clang_header =
            \ "/Library/Developer/CommandLineTools/usr/lib/clang"

      " Rust
      let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
      let g:deoplete#sources#rust#rust_source_path='~/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
      autocmd FileType txt let b:deoplete_disable_auto_complete = 1
      autocmd FileType tex let b:deoplete_disable_auto_complete = 1
      autocmd FileType md let b:deoplete_disable_auto_complete = 1
      set completeopt+=noinsert
      " set completeopt-=preview
else
    Plug 'vim-syntastic/syntastic'
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
      let g:syntastic_rust_checkers = ['cargo']
endif

" Misc plugins
Plug 'jez/vim-superman'
  " ----- jez/vim-superman settings -----
  " better man page support
  noremap K :SuperMan <cword><CR>
if has("nvim")
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'tmux-plugins/vim-tmux'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

" Colors (must be set after vim-plug loads themes)
colorscheme gruvbox
set background=dark
