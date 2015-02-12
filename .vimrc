""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Platform related settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win64"))
    let g:iswindows=1
    let g:separator="\\"
else
    let g:iswindows=0
    let g:separator="/"
endif

if(g:iswindows==1)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set guifont=Consolas:h14:cANSI
endif

if &t_Co != 256 && ! has("gui_running")  
  echomsg ""
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  echomsg ""
  finish
endif

"enable 256 colors in vim ==> To support powerline
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be IMproved
set nocompatible

" Set backspace
set backspace=eol,start,indent

" Lines folding
set foldenable
set foldnestmax=2
set foldmethod=syntax

" Set fileencodings
set fileencodings=utf-8,chinese,latin-1 ",ucs-bom,gbk,big5
let $LANG="zh_CN.UTF-8"
set termencoding=utf-8
set encoding=utf-8

" Set complete options
set completeopt=longest,menu

" Set wild menu & mode
set wildmenu
set wildmode=longest:full,full

" Set key codes timeout
set ttimeoutlen=100

" Auto change current directory
" I don't need autochdir since I have LeaderF ;)
" set autochdir

" Use absolute paths in sessions
set sessionoptions-=curdir

" Keep more backups for one file
" autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")

" keep 512 lines of command line history
set history=512		

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" Let <leader> be , instead of \
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backup
set backup

" Set backup directory
" TODO add windows settings
"set backupdir=~/.vim/backup
set backupdir=/tmp

" Set swap file directory
" TODO add windows settings
set directory=~/.vim/swap,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show ruler
set ruler

" display incomplete commands
set showcmd		

" Dynamic title
set title

" Display line number
set number

" Always have a status line
set laststatus=2

" Allow to display incomplete line
set display=lastline

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声 
"set vb t_vb= 

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch

"Split the new window on the right&below instead of the left
set splitright
set splitbelow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable magic matching
set magic

" Show matching bracets
set showmatch

" Highlight search things
set hlsearch

" Ignore case when searching
set smartcase
set ignorecase

" Incremental match when searching
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto indent
set autoindent

" Smart indet
set smartindent

" Use hard tabs
"set tabstop=8
"set noexpandtab
"set shiftwidth=8

" expand tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Break long lines
set textwidth=80 " wrap text for 78 letters

" Set auto-formating
set formatoptions+=mM

" Config C-indenting
set cinoptions=:0,l1,t0,g0

" set textwidth for mail
autocmd FileType mail set textwidth=72
autocmd FileType mkd set textwidth=0
" Use soft tabs for python
autocmd FileType python set expandtab shiftwidth=4 softtabstop=4 foldmethod=indent
autocmd FileType php set foldmethod=indent
autocmd FileType ruby set shiftwidth=2 softtabstop=2 foldnestmax=4
autocmd FileType javascript set shiftwidth=2 softtabstop=2 foldmethod=indent foldnestmax=4 textwidth=120

" Use extension to set filetype
" autocmd BufNewFile,BufRead *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags & Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" see: http://cscope.sourceforge.net/cscope_maps.vim

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate
    "
    " Auto finding. The last semicolon is the key here. When Vim tries to locate
    " the 'tags' file, it first looks at the current directory, then the parent
    " directory, then the parent of the parent, and so on.
    set tags=tags;
    "添加ctags自动搜索路径，以支持STL
    "TODO Windows compatible
    "set tags+=$HOME/.vim/stl_ctags
    "set tags+=~/.vim/stl_ctags

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set cscopetagorder=0

    " Use quickfix window to show cscope results
    set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

    " Use autoload_cscope instead ;)
    " add any cscope database in current directory of vim or current directory of the shell.
    "if filereadable("cscope.out")
    "    cs add cscope.out
    "elseif filereadable($PWD.g:separator."cscope.out")
    "    exe "cs add" $PWD.g:separator."cscope.out"
    "" else add the database pointed to by environment variable 
    "elseif $CSCOPE_DB != ""
    "    cs add $CSCOPE_DB
    "endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "                 查找本C符号(跳过注释)
    "   'g'   global: find global definition(s) of the token under cursor
    "                 查找全局定义
    "   'c'   calls:  find all calls to the function name under cursor
    "                 查找所有本函数被调用的语句
    "   't'   text:   find all instances of the text under cursor
    "                 查找本字符串
    "   'e'   egrep:  egrep search for the word under cursor
    "                 查找本 egrep 模式
    "   'f'   file:   open the filename under cursor
    "                 打开本文件
    "   'i'   includes: find files that include the filename under cursor
    "                   查找包含本文件的文件
    "   'd'   called: find functions that function under cursor calls
    "                 查找被本函数调用的函数
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>      

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>     
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>     
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>     
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>     
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>     
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>     
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>     

    " not works :(
    "nnoremap <silent><Leader><C-@>s <C-@>s<C-w>T
    "nnoremap <silent><Leader><C-@>g <C-@>g<C-w>T
    "nnoremap <silent><Leader><C-@>c <C-@>c<C-w>T
    "nnoremap <silent><Leader><C-@>t <C-@>t<C-w>T
    "nnoremap <silent><Leader><C-@>e <C-@>e<C-w>T
    "nnoremap <silent><Leader><C-@>f <C-@>f<C-w>T
    "nnoremap <silent><Leader><C-@>i <C-@>i<C-w>T
    "nnoremap <silent><Leader><C-@>d <C-@>d<C-w>T

    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

    "end scope mappings
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" http://lilydjwg.is-programmer.com/posts/23574.html
"if ! has("gui_running")
"    "修复ALT键 可用Alt控制缓冲区移动等，但不能在Insert模式下使用
"    for i in range(97,122) " a-z in ascii
"        let c=nr2char(i)
"        exec "set <M-".c.">=\<Esc>".c
"    endfor
"    set ttimeoutlen=50
"
"    "避免终端退出时乱码
"    set t_fs=(B
"    set t_IE=(B
"else
"    set guioptions=a  "去掉菜单等，自动复制选择的区域
"    set guicursor=a:blinkwait600-blinkoff600-blinkon600 "光标闪烁频率
"    set guifont=Monospace\ 11
"endif


" Tab navigation
" nnoremap : Normal mode NO REcursive MAP key
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap gf <C-W>gf

" Move among windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l


" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" NERDTreeTabsToggle
" This need nerdtree and nerdtreetabs both installed, press t to open the file
" in a new tab, press ENTER to open in the current window.
"nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Toggle display line number
"nnoremap <silent> <F3> :set number!<CR>
nnoremap <silent> <F3> :set foldenable!<CR>

" Paste toggle
set pastetoggle=<F4>

" Save & Make 
nnoremap <F5> :w<CR>:make!<CR>
nnoremap <F6> :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" Quickfix window
nnoremap <silent> <F7> :botright copen<CR>
nnoremap <silent> <F8> :cclose<CR>

" Toggle Tagbar, more convenient than TList
nnoremap <silent> <F9> :TagbarToggle<CR>

" Grep search tools
nnoremap <F10> :Rgrep<CR>

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Use xsel to access the X clipboard
if $DISPLAY != '' && executable('xsel')
    nnoremap <silent> "*y :'[,']w !xsel -i -p -l /dev/null<CR>
    nnoremap <silent> "*p :r!xsel -p<CR>
    nnoremap <silent> "+y :'[,']w !xsel -i -b -l /dev/null<CR>
    nnoremap <silent> "+p :r!xsel -b<CR>
endif

"map <F11> :silent! Tlist<CR>
nnoremap <F11> :call Do_CsTag( getcwd() .g:separator )<CR>
nnoremap <F12> :call Do_CsTag( $PWD .g:separator )<CR>
"map <F4> :call TitleDet()<cr>'s
nnoremap <leader>P :BlogPreview<CR>
nnoremap fg :Dox<cr>


"Tabularize mapping. 
"TODO I don't know why I cannot map :Tabularize /|<CR> ?
"if exists(":Tabularize")
nmap <Leader>aa= :Tabularize /=<CR>
vmap <Leader>aa= :Tabularize /=<CR>
nmap <Leader>aa: :Tabularize /:\zs<CR>
vmap <Leader>aa: :Tabularize /:\zs<CR>
"endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"此方法见http://xwz.me/blog/2010/11/29/01-23/
"if(executable('ctags'))
"    silent! execute "!g++ -E % -o tmpcpp -I./include"
"    silent! execute "!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q --language-force=C++ ."
"    silent! execute "!unlink tmpcpp"
"endif

"cscope ctags 函数定义
"cscope使用绝对路径的两个方法：
"1，直接find绝对路径或添加cscope -P /path 参数，使文件列表全部以绝对路径表示；
"2. :cscope add /path/to/cscope.out /path/to/src/code
function! Do_CsTag(prefix)
    let dir = getcwd()
    if filereadable(a:prefix."tags")
        let tagsdeleted=delete(a:prefix."tags")
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable(a:prefix."cscope.files")
        let csfilesdeleted=delete(a:prefix."cscope.files")
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable(a:prefix."cscope.out")
        let csoutdeleted=delete(a:prefix."cscope.out")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f " .a:prefix ."tags " .a:prefix
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find " .a:prefix ." -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.php' -o -name '*.py' -o -name '*.java' -o -name '*.cs' -o -name '*.rb' > " .a:prefix ."cscope.files"
        else
            "FIXME　windows下从a:prefix扫描
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.php,*.py,*.java,*.cs >> " .a:prefix ."cscope.files"
        endif
        "cscope -b or cscope -bq ?
        silent! execute "!cscope -b -i" .a:prefix ."cscope.files -f " .a:prefix ."cscope.out"
        execute "normal :"
        if filereadable(a:prefix."cscope.out")
            execute "cs add " .a:prefix ."cscope.out"
        endif
    endif

    "解决白屏问题
    execute "redraw!"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"DoxygenToolkit插件配置
"map fg : Dox<cr> //见Mapping一节
let g:DoxygenToolkit_authorName="Cherrot Luo"
let g:DoxygenToolkit_licenseTag="GPLv3\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"neocomplete 使用Lua的下一代代码补全插件
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"neocomplete compatible with clang_complete / vim-clang
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif 
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
            \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
            \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
"let g:clang_use_library = 1


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
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" Set Tagbar width
let tagbar_width = 32

" Use my own cscope mappings
let autocscope_menus = 0

" Use context to decide completion type
let SuperTabDefaultCompletionType = "context"

"vim-repress插件 see https://bitbucket.org/pentie/vimrepress
"now config is ~/.vimpressrc
"let VIMPRESS = [{'username':'cherrot',
            "\'blog_url':'http://www.cherrot.com/'
            "\}]
"map <leader>P :BlogPreview<CR> 见 Mapping 一节

"对NERD_commenter的设置,在光标所在行上，按ctrl+h变换注释,cm是多行注释,cu是取消注释
let NERDShutUp=1

"a.vim插件 :A，打开.cpp和.h对应的文件，:AV，分屏显示.cpp和.h对应的文件(无需配置)

"set guifont=PowerlineSymbols\ for\ Powerline
let g:Powerline_symbols = 'fancy'

"I get trouble maping <M-n> and <M-p> :(
let g:EchoFuncKeyNext = '<C-j>'
let g:EchoFuncKeyPrev = '<C-k>'
"imap  n <M-n>3<BS>
"imap  p <M-p>3<BS>

"disable folding in markdown
"let g:vim_markdown_folding_disabled=1

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Now I don't think it a good idea not to use the default `python`, 
" use vertualenv instead of global setting.
" let g:syntastic_python_python_exec = '/usr/bin/python2'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-pathogen plugin 
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()

" Vundle plugin manager
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
call vundle#begin()

"let g:vundle_default_git_proto = 'ssh'
"
Bundle 'gmarik/Vundle.vim'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Align'
Bundle 'autoload_cscope.vim'
Bundle 'bufexplorer.zip'
" Bundle 'kien/ctrlp.vim'
" Better than ctrlp :)
Bundle 'Yggdroot/LeaderF'
Bundle 'echofunc.vim'
Bundle 'lilydjwg/fcitx.vim'
Bundle 'grep.vim'
Bundle 'Indent-Guides'
"Bundle 'Markdown'
"tabular is Used by vim-markdown
"and also an awesome formatter plugin!
Plugin 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'matchit.zip'
"snipMate would disable my TAB! 
"Bundle 'snipMate'
Bundle 'SuperTab-continued.'
Bundle 'Tagbar'
"Bundle 'tagbar-phpctags'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
"Bundle 'jistr/vim-nerdtree-tabs'
"Bundle 'a.vim'
Bundle 'DoxygenToolkit.vim'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'justmao945/vim-clang'
"Bundle 'scrooloose/syntastic'
"Bundle 'pkufranky/VimRepress'
Bundle 'VimRepress'
Bundle 'altercation/vim-colors-solarized'
"syntax checker
Bundle 'scrooloose/syntastic'
Bundle 'python.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"If your ~/.vim/bundle/ is empty except vundle, execute the following cmd:
":BundleInstall

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlight
" The ':syntax enable' command will keep your current color settings.  This
" allows using ':highlight' commands to set your preferred colors before or
" after using this command.  If you want Vim to overrule your settings with the
" defaults, use: ':syntax on'
" syntax on
syntax enable

"Use black background 
if has('gui_running')
    set background=light
else
    set background=dark
endif

"use solarized/osx-terminal.app-colors-solarized is not enough!
"You need modify the `ANSI color` config in Preference (listed as follows):
" 073642 DC322F 859900 B58900 268BD2 D33682 2AA198 EEE8D5
" 002B36 CB4B16 586E75 657B83 839496 6C71C4 93A1A1 FDF6E3
" text: 839496 bold: 93A1A1 selected: whatever
" background: 002B36

"if(!has('gui_running'))
  "let g:solarized_termcolors=&t_Co
  "let g:solarized_termtrans=1
"endif
" Set colorscheme
"colorscheme desert
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to autoload_cscope to support all types of sources files.
" au BufEnter *      call <SID>Cycle_csdb() | call <SID>Cycle_macros_menus()
" au BufUnload *     call <SID>Unload_csdb() | call <SID>Cycle_macros_menus()

" Set to leaderF to support search from the CWD of the current shell.
" exec 'nnoremap <silent>' g:Lf_ShortcutF ':<C-U>Leaderf '.$PWD.'<CR>'
