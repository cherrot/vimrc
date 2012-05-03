"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
set nocompatible

"显示行号 
set nu 

"检测文件的类型 
filetype on 

"记录历史的行数 
"set history=1000 

"背景使用黑色 
"set background=dark 

"语法高亮显示 
syntax on 

"第一行，vim使用自动对齐，也就是把当前行的对起格式应用到下一行； 
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编 
"写上很有用 
"set autoindent 
"set smartindent 

if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
    set autoindent " always set autoindenting on 
endif " has("autocmd")


"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格 
set tabstop=4 
set shiftwidth=4 

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch 

"去除vim的GUI版本中的toolbar 
"set guioptions-=T 

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声 
"set vb t_vb= 

"在编辑过程中，在右下角显示光标位置的状态行 
set ruler 

"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示 
"set nohls 

"高亮显示搜索结果
set hlsearch

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一 
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依 
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词 
"时，别忘记回车 
set incsearch 

"修改一个文件后，自动进行备份，备份的文件名为原文件名加“~“后缀 
"if has(“vms”) 
"	set nobackup 
"else 
"	set backup 
"endif 


"vim-pathogen plugin 该插件可以将每个github的vim plugin工程单独放到bundle目录下
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"vim-repress插件 see https://github.com/vim-scripts/VimRepress
let VIMPRESS = [{'username':'cherrot',
                \'blog_url':'http://www.cherrot.com/'
                \}]
map <leader>P :BlogPreview<CR>

"代码折叠
:set fdm=syntax


"自动更改到当前文件所在的目录
autocmd BufEnter * lcd %:p:h 


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

"OmniCppComplete Plugin
set nocp
filetype plugin on

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
    call append(0,"/*============================================
    =================================")
    call append(1,"#")
    call append(2,"# Author: Cherrot Luo - admin@cherrot.com")
    call append(3,"#")
    call append(4,"#")
    call append(5,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"#")
    call append(7,"# Filename: ".expand("%:t"))
    call append(8,"#")
    call append(9,"# Description: ")
    call append(10,"#")
    call append(11,"===========================================
    ==================================*/")
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

