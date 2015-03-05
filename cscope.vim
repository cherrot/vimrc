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
