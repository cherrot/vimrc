let $LANG="zh_CN.UTF-8"
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
set encoding=utf-8

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
set backspace=indent,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif

set history=512		" keep 512 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu
set sw=6
set ts=6
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype on
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

    augroup END

else
    set autoindent		" always set autoindenting on
    set smartindent     " 根据上面的对齐方式智能对齐

endif " has("autocmd")

"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格 
set tabstop=4 
set shiftwidth=4 
set softtabstop=4
set smarttab
set expandtab

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声 
"set vb t_vb= 

"背景使用黑色 
"set background=dark 

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch 

"去除vim的GUI版本中的toolbar 
"set guioptions-=T 

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声 
"set vb t_vb= 

"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示 
"set nohls 

"代码折叠
set fdm=syntax

"自动cd到当前文件所在的目录
"autocmd BufEnter * lcd %:p:h 

"vim-pathogen plugin 该插件可以将每个github的vim plugin工程单独放到bundle目录下
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"vim-repress插件 see https://github.com/vim-scripts/VimRepress
let VIMPRESS = [{'username':'cherrot',
                \'blog_url':'http://www.cherrot.com/'
                \}]
map <leader>P :BlogPreview<CR>


"映射cscope命令： cs find c|d|e|f|g|i|s|t name
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR> "0或s:查找本C符号(可以跳过注释)
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR> "1或g:查找本定义
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR> "3或c:查找调用本函数的函数
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR> "4或t:查找本字符串
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR> "6或e: 查找本 egrep 模式
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR> "7或f: 查找本文件
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR> "8或i:查找包含本文件的文件
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR> "2或d:查找本函数调用的函数

"同时搜索ctags和cscope的标签，并且cscope优先
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cst
    set csverb
endif


"taglist插件，进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0


"OmniCppComplete Plugin 目前用neocomplcache

"对NERD_commenter的设置,在光标所在行上，按ctrl+h变换注释,cm是多行注释,cu是取消注释
let NERDShutUp=1


"DoxygenToolkit插件配置
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="Cherrot Luo"
let g:DoxygenToolkit_licenseTag="GPLv3\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"a.vim插件 :A，打开.cpp和.h对应的文件，:AV，分屏显示.cpp和.h对应的文件(无需配置)

"neocomplcache 代码补全插件
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1


"ctag 配置
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

"添加ctags自动搜索路径，以支持STL
set tags+=$HOME/.vim/stl_ctags

"此方法见http://xwz.me/blog/2010/11/29/01-23/
"if(executable('ctags'))
"    silent! execute "!g++ -E % -o tmpcpp -I./include"
"    silent! execute "!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q --language-force=C++ ."
"    silent! execute "!unlink tmpcpp"
"endif

"cscope 函数定义  用cscope生成数据库，并添加到vim中
"function Do_CsTag()
"    if(executable('cscope') && has("cscope") )
"        if(g:iswindows!=1)
"            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
"        else
"            silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
"        endif
"        silent! execute "!cscope -b"
"        if filereadable("cscope.out")
"            execute "cs add cscope.out"
"        endif
"    endif
"endf

"ctags 函数定义
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction


"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*=============================================================================")
    call append(1,"#")
    call append(2,"# Author: Cherrot Luo - cherrot+vim@cherrot.com")
    call append(3,"#")
    call append(4,"#")
    call append(5,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"#")
    call append(7,"# Filename: ".expand("%:t"))
    call append(8,"#")
    call append(9,"# Description: ")
    call append(10,"#")
    call append(11,"=============================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

"去除vim的GUI版本中的toolbar 
"set guioptions-=T 
