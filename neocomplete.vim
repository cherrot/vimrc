""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config of neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Use fuzzy completion.
let g:neocomplete#enable_fuzzy_completion = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" Enable omni completion.

"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType python setlocal omnifunc=jedi#completions

let g:neocomplete#sources#omni#functions.html = 'htmlcomplete#CompleteTags'
let g:neocomplete#sources#omni#functions.javascript = 'javascriptcomplete#CompleteJS'
let g:neocomplete#sources#omni#functions.css = 'csscomplete#CompleteCSS'
let g:neocomplete#sources#omni#functions.xml = 'xmlcomplete#CompleteTags'
"let g:neocomplete#sources#omni#functions.python = 'pythoncomplete#Complete'
let g:neocomplete#sources#omni#functions.python = 'jedi#completions'
let g:neocomplete#sources#omni#functions.go = 'gocomplete#Complete'


"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
"let g:neocomplete#sources#omni#input_patterns.python = '[^. *\t]\.\w*\|\h\w*'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.\w*'

"let g:neocomplete#force_omni_input_patterns.python = 
"            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

""neocomplete compatible with clang_complete / vim-clang
"let g:neocomplete#force_overwrite_completefunc = 1
"let g:neocomplete#force_omni_input_patterns.c =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:neocomplete#force_omni_input_patterns.objc =
"            \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
"let g:neocomplete#force_omni_input_patterns.objcpp =
"            \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 0
""let g:clang_use_library = 1


let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
