" setlocal omnifunc=LanguageClient#Complete
" let deoplete#enable_at_startup=1
" call deoplete#custom#option('source', {
"             \ 'python': ['LanguageClient']
"             \ })
" call deoplete#custom#source('LanguageClient',
"             \ 'min_pattern_length',
"             \ 2)
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif

" Run gofmt on save
"autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" Comment char
setlocal commentstring=\/\/\ %s
