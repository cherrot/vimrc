"pretty print json (I don't want it map to any key):
":%!python -m json.tool
"ctrl+r = to insert a caculated value
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

"Split the new window on the right&below instead of the left
set splitright
set splitbelow

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

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

" Set auto-formating. mM for chinese charaters, n for number list auto-indent
set formatoptions+=mMn

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
source ~/.vim/cscope.vim

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
nnoremap <silent> <Leader>1 :NERDTreeToggle<CR>

" Toggle display line number
nnoremap <Leader>2 :set number!<CR>
nnoremap <Leader>3 :set foldenable!<CR>

" Paste toggle
set pastetoggle=<Leader>4

" Save & Make 
nnoremap <Leader>5 :w<CR>:make!<CR>
nnoremap <Leader>6 :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" Quickfix window
nnoremap <Leader>7 :botright copen<CR>
nnoremap <Leader>8 :cclose<CR>

" Toggle Tagbar, more convenient than TList
nnoremap <silent> <Leader>9 :TagbarToggle<CR>

" Grep search tools
nnoremap <Leader>0 :Rgrep<CR>
"map <F11> :silent! Tlist<CR>
nnoremap <Leader>- :call Do_CsTag( getcwd() .g:separator )<CR>
nnoremap <Leader>= :call Do_CsTag( $PWD .g:separator )<CR>

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Use xsel to access the X clipboard
if $DISPLAY != '' && executable('xsel')
    nnoremap <silent> "*y :'[,']w !xsel -i -p -l /dev/null<CR>
    nnoremap <silent> "*p :r!xsel -p<CR>
    nnoremap <silent> "+y :'[,']w !xsel -i -b -l /dev/null<CR>
    nnoremap <silent> "+p :r!xsel -b<CR>
endif

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
source ~/.vim/neocomplete.vim
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"

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

"powerline config
"set guifont=PowerlineSymbols\ for\ Powerline
"let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme                              = 'powerlineish'
let g:airline#extensions#branch#enabled          = 1
"It often cause syntastic not working
let g:airline#extensions#syntastic#enabled       = 1
let g:airline#extensions#tagbar#enabled          = 1
let g:airline#extensions#virtualenv#enabled      = 1
"let g:airline#extensions#tabline#enabled         = 1
"let g:airline#extensions#tabline#show_buffers    = 1
"let g:airline#extensions#tabline#show_tabs       = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1

""let g:airline_powerline_fonts            = 1
"" vim-powerline symbols
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep          = '»'
let g:airline_left_sep           = '▶ '
"let g:airline_left_alt_sep      = '>'
"let g:airline_right_sep         = '«'
let g:airline_right_sep          = '◀ '
"let g:airline_right_alt_sep     = '<'
"let g:airline_symbols.linenr     = '␊'
"let g:airline_symbols.linenr     = '␤'
"let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
"let g:airline_symbols.paste      = 'ρ'
"let g:airline_symbols.paste      = 'Þ'
"let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_branch_prefix     = ''
"let g:airline_readonly_symbol   = ''
"let g:airline_linecolumn_prefix = ''

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

let g:LargeFile = 10

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
"Bundle 'Lokaltog/powerline'
Bundle 'bling/vim-airline'
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
"Bundle 'pkufranky/VimRepress'
Bundle 'VimRepress'
Bundle 'altercation/vim-colors-solarized'
"syntax checker
Bundle 'scrooloose/syntastic'
"python.vim has mapped tooooo many keys! (even `[c`)
"Bundle 'python.vim'
Bundle 'LargeFile'
Bundle 'mkitt/tabline.vim'
Bundle 'MattesGroeger/vim-bookmarks'
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'TaskList.vim'

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
" text: 839496 bold: 93A1A1 selected: whatever (mine: EEE8D5)
" cursor: whatever (mine: 575757)
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
"let s:SID = Sid('bundle/autoload_cscope.vim/plugin/autoload_cscope.vim')
"function! s:Is( input, expected, description )
    "let l:got = SidInvoke(s:SID, printf("IsWildcardPathPattern('%s')", a:input))
    "call vimtap#Is(l:got, a:expected, a:description)
"endfunction

" Set to autoload_cscope to support all types of sources files.
" au BufEnter *      call <SID>Cycle_csdb() | call <SID>Cycle_macros_menus()
" au BufUnload *     call <SID>Unload_csdb() | call <SID>Cycle_macros_menus()
" that's not work
" au BufEnter *.py   call autoload_cscope#Cycle_csdb() | call autoload_cscope#Cycle_macros_menus()

" Set to leaderF to support search from the CWD of the current shell.
" exec 'nnoremap <silent>' g:Lf_ShortcutF ':<C-U>Leaderf '.$PWD.'<CR>'
