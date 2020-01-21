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
Plugin 'lifepillar/vim-solarized8'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'diepm/vim-rest-console'
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'Shougo/echodoc'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim'
Plugin 'liuchengxu/vista.vim'

" ----- Snipets  ------------------------------------------------------

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" ----- Working with Git ----------------------------------------------

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/fzf.vim'

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

Plugin 'phpactor/phpactor'
Plugin 'Shougo/unite.vim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

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

"---- Python Support -------------------------------------------------
Plugin 'nvie/vim-flake8'

"---- Python Support -------------------------------------------------
Plugin 'reasonml-editor/vim-reason-plus'

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
set background=dark
set termguicolors
colorscheme solarized8_high

set mouse=a
set updatetime=300
set shortmess+=c
set rtp+=/usr/local/opt/fzf

" ----- Plugin-Specific Settings --------------------------------------
" coc.nvim settings

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

highlight CocHighlightText guibg=#777777 guifg=#ffff00

autocmd CursorHold * silent call CocActionAsync('highlight')

" ----- fugitive settings --------------
nmap <leader>gpb  :execute ":Gpush origin " . fugitive#head(0)<CR>

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


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,tags;
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- liuchengxu/vista.vim settings -----
let g:vista_default_executive = 'coc'
nmap <silent> <leader>b :Vista!!<CR>


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:gitgutter_sign_priority = 0


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
inoremap <Leader><TAB>  <ESC>:Buffers<CR>
nnoremap <Leader><TAB>  :Buffers<CR>
inoremap <Leader>g <ESC>:e#<CR>
nnoremap <Leader>g :e#<CR>


set directory=~/.vim/swap

" Ctrl-P config
let g:ctrlp_working_path_mode='c'
let g:ctrlp_custom_ignore='\v[\/](node_modules|target|dist|\.git)|(\.(swp|ico|gif|svn))$'

" vim-rest-console settings
let g:vrc_auto_format_response_patterns = {
  \ 'json': 'python3 -m json.tool',
  \ 'xml': 'xmllint --format -',
\}
let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
\}

" ==== fzf.vim =============================================
" FZF to checkout git branches, Usage: GCheckout
function! s:open_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0]
  if l:branch ==? '*'
    let l:branch = l:parser[1]
  endif
  execute '!git checkout ' . l:branch
endfunction

function! s:GCheckout(args) abort
  if empty(a:args)
    call fzf#vim#grep('git branch -v', 0, { 'sink': function('s:open_branch_fzf') })
  else
    execute '!git checkout' a:args
  endif
endfunction

command! -bang -nargs=? Gco :execute s:GCheckout(<q-args>)

" Echodoc
set cmdheight=2
set signcolumn=yes
let g:echodoc_enable_at_startup = 1

" ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}
let g:airline#extensions#ale#enabled = 1

nmap <Leader>\ :call LanguageClient_contextMenu()<CR>
set foldmethod=manual
