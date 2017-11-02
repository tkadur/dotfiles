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

  let g:airline#extensions#ale#enabled = 1

  " let g:airline_section_c = ''
  let g:airline_section_y = ''

Plug 'mhinz/vim-startify'

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'jez/vim-better-sml'
  " ----- jez/vim-better-sml settings -----
  au Filetype sml setlocal conceallevel=2
Plug 'jez/vim-c0'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

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
Plug 'tpope/vim-fugitive'
Plug 'Kazark/vim-SimpleSmoothScroll'
Plug 'mbbill/undotree'

" Tag plugins
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
  " ----- majutsushi/tagbar settings -----
  " Open/close tagbar with \b
  nmap <silent> <C-b> :TagbarToggle<CR>
  let g:tagbar_sort = 0
  " Uncomment to open tagbar automatically whenever possible
  "autocmd BufEnter * nested :call tagbar#autoopen(0)

" Syntax/completion plugins
if has("nvim") || v:version >= 800
  Plug 'w0rp/ale'
    " ----- w0rp/ale settings -----
    " We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
    hi clear SignColumn
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '▲'
    " let g:ale_set_loclist=0
    " let g:ale_set_quickfix=1
    let g:ale_open_list = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_run_on_insert_leave = 1
    let g:ale_linters = {
          \  'c'    : ['clang'],
          \  'cpp'  : ['clang'],
          \}
    " Don't report refactor or convention errors
    let g:ale_python_pylint_options = '--disable=R,C'
endif

if has("nvim")
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ }

    " Automatically start language servers.
    let g:LanguageClient_autoStart = 1

    " Don't let this do ALE's job
    let g:LanguageClient_diagnosticsList = "location"
    let g:LanguageClient_diagnosticsEnable = 0

    nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> <C-r> :call LanguageClient_textDocument_rename()<CR>

  Plug 'ervandew/supertab'
    " ----- ervandew/supertab settings -----
    let g:SuperTabDefaultCompletionType = "<c-n>"

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'Shougo/neoinclude.vim'
  Plug 'zchee/deoplete-clang'
  " Plug 'sebastianmarkow/deoplete-rust'
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

    set completeopt-=preview
    " " Automatically close deoplete preview window
    " au CompleteDone * silent! pclose!

elseif v:version < 800
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
  " " ----- jez/vim-superman settings -----
  " " better man page support
  " noremap K :SuperMan <cword><CR>

Plug 'tmux-plugins/vim-tmux'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

call plug#end()

" Colors (must be set after vim-plug loads themes)
colorscheme gruvbox
set background=dark
