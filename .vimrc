" :%!python -m json.tool        "pretty print json:
" C-r =                         "to insert a caculated value
" :w !sudo tee %                "to save file with sudo
"
"" when in insert mode, temporary switch to normal mode;
"" when in normal mode, jump back. (<TAB> or C-i to jump forward)
" C-o
"
"" convert ascii in json to utf-8:
" native2ascii -encoding UTF-8 -reverse src.json out.json
"
" :%!xxd     view in hex mode
" :%!xxd -r  write back

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
set foldmethod=indent

" Set fileencodings
set fileencodings=utf-8,chinese,latin-1,ucs-bom,gbk,big5
"let $LANG="zh_CN.UTF-8"
set termencoding=utf-8
set encoding=utf-8

" Set complete options
set completeopt=longest,menuone

" Set wild menu & mode
set wildmenu
set wildmode=longest:full,full

" Set key codes timeout
set ttimeoutlen=100

" Use absolute paths in sessions
set sessionoptions-=curdir

" Let <leader> be , instead of \
let mapleader = ","

" Auto change current directory
" I don't need autochdir since I have LeaderF ;)
" set autochdir

" Set current working directory automatically
" autocmd BufEnter * silent! lcd %:p:h

" :help readonly
"set noro


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

"Do not alarm
"set vb t_vb= 

"Split the new window on the right&below instead of the left
set splitright
set splitbelow

set scrolloff=2

set cursorcolumn


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

" Use solarized/osx-terminal.app-colors-solarized is not enough!
" You need modify the `ANSI color` config in Preference (listed as follows):
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
colorscheme desert


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
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable backup
set backup

" Set backup directory
set backupdir=~/.vim/backup,/tmp

" Set swap file directory
set directory=~/.vim/swap,/tmp
" Keep more backups for one file
" autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")

" keep 512 lines of command line history
" set history=512		


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
  echomsg "Please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  finish
endif

"enable 256 colors in vim ==> To support powerline
set t_Co=256


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto indent
set autoindent

" Smart indet
set smartindent

" Use hard tabs
set tabstop=8
"set noexpandtab
"set shiftwidth=8

" expand tabs
set shiftwidth=4
"set softtabstop=4
set expandtab "this can be set in buffer scope
set smarttab "this is a global config

" Break long lines
"set textwidth=78

" Set auto-formating. mM for chinese charaters, n for number list auto-indent
set formatoptions+=mMn

" Config C-indenting
set cinoptions=:0,l1,t0,g0,(0

" set textwidth for mail
autocmd FileType mail set textwidth=72
" Use soft tabs for python
autocmd FileType python set softtabstop=4 foldmethod=indent foldnestmax=3
autocmd FileType php set foldmethod=indent
autocmd FileType ruby set shiftwidth=2 softtabstop=2 foldnestmax=4
autocmd FileType javascript set shiftwidth=2 softtabstop=2 foldmethod=indent foldnestmax=4
autocmd FileType go set noexpandtab shiftwidth=4 tabstop=4
" Use extension to set filetype
" autocmd BufNewFile,BufRead *.md set filetype=markdown


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags & Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/cscope.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
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
nnoremap <Leader><Leader>7 :lopen<CR>
nnoremap <Leader>8 :cclose<CR>
nnoremap <Leader><Leader>8 :lclose<CR>

" Toggle Tagbar, more convenient than TList
nnoremap <silent> <Leader>9 :TagbarToggle<CR>

" Grep search tools
"nnoremap <Leader>0 :Rgrep<CR>
nnoremap <Leader>0 :Ag <C-R>=expand("<cword>")<CR> ./
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
nnoremap fg :Dox<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap <Leader>f :FzfFiles<CR>
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>m :FzfHistory<CR>
nnoremap <Leader>g :FzfGitFiles<CR>

"autocmd FileType go nmap <Leader>s <Plug>(go-implements)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"

source ~/.vim/neocomplete.vim

" Fzf command prefix
let fzf_command_prefix = 'Fzf'

"DoxygenToolkit插件配置
"map fg : Dox<cr> //见Mapping一节

" Python jedi plugin config
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>a"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"
"use neocomplete
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

" Set Tagbar width
let tagbar_width = 32

" Use my own cscope mappings
let autocscope_menus = 0

" Use context to decide completion type
"let SuperTabDefaultCompletionType = "context"

"对NERD_commenter的设置,在光标所在行上，按ctrl+h变换注释,cm是多行注释,cu是取消注释
let NERDShutUp=1

" Add extra spaces when (un)commenting
let NERDSpaceDelims = 1
" Otherwise in python i would get 2 spaces after #
let g:NERDCustomDelimiters = {'python': {'left': '#'}}

"let g:LargeFile = 10


" Vim-go plugin settings
"let go_fmt_fail_silently = 1
let go_highlight_functions = 1
"let go_highlight_methods = 1
let g:go_highlight_types = 1
let go_highlight_structs = 1
let go_highlight_operators = 1
let go_highlight_build_constraints = 1


"frontend development for css,html
" use <Leader> instead of <C-y> 
" ,, expand html,css etc.
" ,/ comment html,css,scss,sass,less
" More :help emmet-customize 
"emmet mapping.
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
"let g:user_emmet_expandabbr_key = '<tab>'
let g:user_emmet_leader_key = "<leader>"


"powerline config
"set guifont=PowerlineSymbols\ for\ Powerline
"let g:Powerline_symbols = 'fancy'

"let g:airline_theme                              = 'powerlineish'
let g:airline#extensions#branch#enabled          = 1
"It often cause syntastic not working
let g:airline#extensions#syntastic#enabled       = 1
let g:airline#extensions#tagbar#enabled          = 1
let g:airline#extensions#virtualenv#enabled      = 1

""let g:airline_powerline_fonts            = 1
"" vim-powerline symbols
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif

"" unicode symbols
""let g:airline_left_sep          = '»'
"let g:airline_left_sep           = '▶ '
""let g:airline_left_alt_sep      = '>'
""let g:airline_right_sep         = '«'
"let g:airline_right_sep          = '◀ '
""let g:airline_right_alt_sep     = '<'
""let g:airline_symbols.linenr     = '␊'
""let g:airline_symbols.linenr     = '␤'
""let g:airline_symbols.linenr     = '¶'
"let g:airline_symbols.branch     = '⎇'
""let g:airline_symbols.paste      = 'ρ'
""let g:airline_symbols.paste      = 'Þ'
""let g:airline_symbols.paste      = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
""let g:airline_branch_prefix     = ''
""let g:airline_readonly_symbol   = ''
""let g:airline_linecolumn_prefix = ''

"I get trouble maping <M-n> and <M-p> :(
"let g:EchoFuncKeyNext = '<C-j>'
"let g:EchoFuncKeyPrev = '<C-k>'
"imap  n <M-n>3<BS>
"imap  p <M-p>3<BS>

"disable folding in markdown
"let g:vim_markdown_folding_disabled=1


" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" pip install flake8
"let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_checker_args = '--ignore=E221,E501,E225'
"let g:syntastic_python_flake8_args = '--ignore=E221,E502,W391,E126'
let g:syntastic_python_flake8_args = '--ignore=E221,E501,E241,E251,E712'
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

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
" filetype off
"set runtimepath+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
"call vundle#begin()

"vim-plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

call plug#begin('~/.vim/bundle')

"Common vim plugins
"
"Plug 'gmarik/Vundle.vim'
Plug 'autoload_cscope.vim'
" Match html tags using %
Plug 'matchit.zip'
"Plug 'LargeFile'
"Plug 'TaskList.vim'
"python.vim has mapped tooooo many keys! (even `[c`)
"Plug 'python.vim'
"Plug 'echofunc.vim'
"Plug 'Markdown'
"Plug 'DoxygenToolkit.vim'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'mkitt/tabline.vim'
"Plug 'MattesGroeger/vim-bookmarks'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
" set foldmethod to syntax or expr would slow down neocomplete speed, see:
" https://github.com/Shougo/neocomplete.vim/issues/525
Plug 'Konfekt/FastFold'
Plug 'Konfekt/FoldText'

" Plugins need outer world dependencies.
" Plug 'grep.vim'
" Faster than grep.vim. Need install the_silver_searcher first.
Plug 'rking/ag.vim'
Plug 'lilydjwg/fcitx.vim'
"Plug 'Yggdroot/LeaderF'
"Alternative to LeaderF, can be used in terminal too.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plugins for specific languages
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'justmao945/vim-clang'
Plug 'mattn/emmet-vim', { 'for': ['html','css','scss','sass','less'] }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()


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

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).

colorscheme solarized

autocmd FileType html,css,scss,sass,less EmmetInstall

autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
        \ endif
