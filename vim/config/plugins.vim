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
  let g:airline_theme='onedark'

  " let g:airline_section_c = ''
  let g:airline_section_y = ''

Plug 'mhinz/vim-startify'

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'jez/vim-better-sml'
  " ----- jez/vim-better-sml settings -----
  au Filetype sml setlocal conceallevel=2
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" General convenience plugins
Plug 'ConradIrwin/vim-bracketed-paste'
" Plug 'Raimondi/delimitMate'
"   " ----- Raimondi/delimitMate settings -----
"   let g:delimitMate_expand_cr = 1
"   augroup mydelimitMate
"     au!
"     au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
"     au FileType tex let b:delimitMate_quotes = ""
"     au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
"     au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
" augroup END
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
  let g:airline#extensions#branch#enabled = 1
Plug 'airblade/vim-gitgutter'
" Plug 'Kazark/vim-SimpleSmoothScroll'
Plug 'mbbill/undotree'

" Tag plugins
" Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
"  " ----- majutsushi/tagbar settings -----
"  " Open/close tagbar with \b
"  nmap <silent> <C-b> :TagbarToggle<CR>
"  let g:tagbar_sort = 0
"  let g:airline#extensions#tagbar#enabled = 1
"  " Uncomment to open tagbar automatically whenever possible
"  "autocmd BufEnter * nested :call tagbar#autoopen(0)

" Syntax/completion plugins
if has('nvim') || v:version >= 800
  Plug 'w0rp/ale'
    " ----- w0rp/ale settings -----
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
endif

if has('nvim')
  " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  "   let g:LanguageClient_serverCommands = {
  "       \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  "       \ 'cpp': ['$CLANGD'],
  "       \ 'c': ['$CLANGD'],
  "       \ }

  "   " Automatically start language servers.
  "   let g:LanguageClient_autoStart = 1

  "   " Don't let this do ALE's job
  "   let g:LanguageClient_diagnosticsList = 'location'
  "   let g:LanguageClient_diagnosticsEnable = 0

  "   nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  "   nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  "   nnoremap <silent> <C-r> :call LanguageClient_textDocument_rename()<CR>

  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'zchee/deoplete-jedi'
  " " ----- Shougo/deoplete.nvim settings -----
  "   let g:deoplete#enable_at_startup = 1
  "   " use tab to forward cycle
  "   inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  "   " use tab to backward cycle
  "   inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

  "   autocmd FileType txt let b:deoplete_disable_auto_complete = 1
  "   autocmd FileType tex let b:deoplete_disable_auto_complete = 1
  "   autocmd FileType md let b:deoplete_disable_auto_complete = 1

  "   set completeopt+=noinsert

  "   set completeopt-=preview
  "   " " Automatically close deoplete preview window
  "   " au CompleteDone * silent! pclose!

elseif v:version < 800
  Plug 'vim-syntastic/syntastic'
    " ----- Syntastic settings

    " We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
    hi clear SignColumn
    let g:syntastic_error_symbol = '✘'
    let g:syntastic_warning_symbol =  '▲'

    augroup mySyntastic
      au!
      au FileType tex let b:syntastic_mode = 'passive'
    augroup END

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_rust_checkers = ['cargo']

    let g:airline#extensions#syntastic#enabled = 1
endif

" Misc plugins
Plug 'jez/vim-superman'

" Plug 'tmux-plugins/vim-tmux'
" Plug 'godlygeek/tabular'

Plug 'wesQ3/vim-windowswap'
  let g:airline#extensions#windowswap#enabled = 1

" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

call plug#end()

" Colors (must be set after vim-plug loads themes)
colorscheme onedark
" set background=dark
