" File: .vimrc
" Author: Lim Afriyadi <lim.afriyadi.id@gmail.com

" Gotta be first
"scriptencoding utf-8
"set encoding=utf-8
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'diepm/vim-rest-console'
Plugin 'autozimu/LanguageClient-neovim'

" ----- Snipets  ------------------------------------------------------

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" ----- Working with Git ----------------------------------------------

" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'

" ----- Symfony Stuffs ------------------------------------------------

Plugin 'nelsyeung/twig.vim'
Plugin 'sniphpets/sniphpets-symfony'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
Plugin 'cakebaker/scss-syntax.vim'

" ---- Vdebug --------------------------------------------------------
Plugin 'joonty/vdebug'

" ---- Shell integration ---------------------------------------------
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'

" ---- PHP Extended Autocomplete -------------------------------------

" Plugin 'shawncplus/phpcomplete.vim'
" Bundle 'arnaud-lb/vim-php-namespace'
Plugin 'Shougo/unite.vim'
Plugin 'phpactor/phpactor'
Plugin 'Shougo/deoplete.nvim'
Plugin 'kristijanhusak/deoplete-phpactor'

" ---- Capture -------------------------------------------------------

" Plugin 'tyru/capture.vim'

" ---- ctags ---------------------------------------------------------

" Plugin 'craigemery/vim-autotag'

"---- PHP Refactor ---------------------------------------------------

" Plugin 'adoy/vim-php-refactoring-toolbox'

"---- PHPQA Tools ----------------------------------------------------

" Bundle 'joonty/vim-phpqa.git'

"---- Scala Support --------------------------------------------------

Plugin 'derekwyatt/vim-scala'

"---- React Support --------------------------------------------------

Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'

"---- Go Suppport ----------------------------------------------------

Plugin 'fatih/vim-go'
Plugin 'sebdah/vim-delve'

"---- Direnv Suppport ------------------------------------------------
Plugin 'direnv/direnv.vim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on
color solarized

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
let g:solarized_contrast="low"
lef g:solarized_termtrans=1


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1


" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,tags;
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
" nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" Disable sign as it conflicts with vim-php-namespace
let g:gitgutter_signs = 0
" turn on line highligthing instead
let g:gitgutter_highlight_lines = 1
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ---- Custom settings --------------------
" Delve settings
let g:delve_enable_syntax_highlighting=1
let g:delve_new_command="new"

" ---------- 'autozimu/LanguageClient-neovim' --------------
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
      \ 'python': ['pyls'],
      \ 'cpp': ['clangd'],
      \ 'go': ['gopls'],
      \ }

let g:LanguageClient_autoStart = 1

" Folding method
set foldmethod=indent

" Tab length
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:x

" Delete trailing white space on write
func! DeleteTrailingWS()
    normal mZ
    %s/\s\+$//ge
    normal `Z
endfunc

" autocmd BufEnter * silent! call DeleteTrailingWS()

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000

" Split preferences
set splitright
set splitbelow

" SearchInline
function! SearchInline(word)
  echo "Search inline for " . a:word
  silent! execute "normal /\\%" . line('.') . "l" . a:word . "\<CR>"
endfunction
command -nargs=1 SearchInline :set nohlsearch|:silent call SearchInline(<f-args>)

nnoremap <buffer> <Leader>a :call SearchInline(input("Keyword: "))<CR>

filetype plugin on

let g:autotagTagsFile=".ctags"
let g:autotagExcludeSuffixes="--exclude=app/cache --exclude=bin --exclude=web --exclude=.git"

" Hide modified buffer
set hidden
" Buffer shortcuts
inoremap <Leader>g <ESC>:e#<CR>
nnoremap <Leader>g :e#<CR>
inoremap <Leader>b <ESC>:b#<CR>
nnoremap <Leader>b :b#<CR>

set complete-=i
set directory=~/.vim/swap

" Ctrl-P config
let g:ctrlp_working_path_mode='c'
let g:ctrlp_custom_ignore='\v[\/](node_modules|target|dist|\.git)|(\.(swp|ico|gif|svn))$'
