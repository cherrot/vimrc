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

" Do not show vim mode in statusline
set noshowmode

" Set fileencodings
set fileencodings=utf-8,chinese,latin-1
"let $LANG="zh_CN.UTF-8"
set termencoding=utf-8
set encoding=utf-8

" Set complete options
set completeopt=longest,menuone

" Set wild menu & mode
set wildmenu
set wildmode=longest:full,full

" Set key codes timeout
set timeout timeoutlen=1000 ttimeoutlen=100

" Use absolute paths in sessions
set sessionoptions-=curdir

" Let <leader> be , instead of \
let mapleader = ","
let maplocalleader = ","

" :help readonly
"set noro

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

"""""""""""""""""""""""""
" coc compatible settings
"""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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
set cursorline

"""""""""""""""""""""""""
" coc compatible settings
"""""""""""""""""""""""""
" Better display for messages. Don't need this any more since vim now supports floating window.
" set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c


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

if &t_Co != 256 && ! has("gui_running")  
  echomsg "Please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  finish
endif

"enable 256 colors in vim ==> To support powerline
set t_Co=256

" For MacOS users:
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

" Set default colorscheme
" colorscheme desert


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
set autowrite
set noswapfile
" Some servers have issues with backup files
set nobackup
set nowritebackup

"set backup
" Set backup directory
"set backupdir=~/.vim/backup,/tmp
" Set swap file directory
"set directory=~/.vim/swap,/tmp

" Keep more backups for one file
" autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")

set undofile
set undodir=~/.vim_undo
set undolevels=1000
set undoreload=10000
set history=10000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto indent
set autoindent

" Smart indet
set smartindent

" Use hard tabs
set tabstop=8

" expand tabs
set shiftwidth=4
set softtabstop=4
set expandtab "this can be set in buffer scope
set smarttab "this is a global config

" Break long lines
"set textwidth=78

" Set auto-formating. mM for chinese charaters, n for number list auto-indent
set formatoptions+=mMn

" Config C-indenting
set cinoptions=:0,l1,t0,g0,(0

" set textwidth for mail
autocmd FileType mail setl textwidth=72
" Use soft tabs for python
autocmd FileType python setl softtabstop=4 foldmethod=indent foldnestmax=3 nosmartindent
autocmd FileType php setl foldmethod=indent
autocmd FileType ruby setl shiftwidth=2 softtabstop=2 foldnestmax=4
autocmd FileType javascript setl shiftwidth=2 softtabstop=2 foldmethod=indent foldnestmax=4
autocmd FileType go setl noexpandtab shiftwidth=4 tabstop=4
autocmd FileType proto setl noexpandtab shiftwidth=4 tabstop=4
autocmd FileType cpp setl noexpandtab shiftwidth=4 tabstop=4
autocmd FileType yaml setl shiftwidth=2 softtabstop=2
autocmd FileType proto setlocal noexpandtab shiftwidth=4 tabstop=4

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab navigation
" nnoremap : Normal mode NO REcursive MAP key
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>

" Move among windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

nnoremap gf <C-W>gf

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" NERDTreeTabsToggle
" This need nerdtree and nerdtreetabs both installed, press t to open the file
" in a new tab, press ENTER to open in the current window.
"nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>1 :NERDTreeToggle<CR>

" Toggle display line number
nnoremap <Leader>2 :set number!<CR>:call ToggleSignColumn()<CR>
nnoremap <Leader>3 :set foldenable!<CR>

" Paste toggle
set pastetoggle=<Leader>4

" Save & Make 
nnoremap <Leader>5 :w<CR>:make!<CR>
nnoremap <Leader>6 :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" Quickfix and Location window
nnoremap <Leader>7 :botright copen<CR>
nnoremap <Leader><Leader>7 :lopen<CR>
nnoremap <Leader>8 :cclose<CR>
nnoremap <Leader><Leader>8 :lclose<CR>
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprevious<CR>
nnoremap <Leader><Leader>n :lnext<CR>
nnoremap <Leader><Leader>p :lprevious<CR>

" Toggle Tagbar, more convenient than TList
nnoremap <silent> <Leader>9 :TagbarToggle<CR>

" grep search tools. Use ! to prevent auto jump.
nnoremap <Leader>0 :Silent grep! \\b<C-R>=expand("<cword>")<CR>\\b
nnoremap <Leader><Leader>0 :Silent grep!<space>
" tasks
nnoremap <Leader>t :Silent grep! TODO\\\|FIXME\\\|XXX<CR>

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Use xsel to access the X clipboard
if $DISPLAY != '' && executable('xsel')
    nnoremap <silent> "*y :'[,']w !xsel -i -p -l /dev/null<CR>
    nnoremap <silent> "*p :r!xsel -p<CR>
    nnoremap <silent> "+y :'[,']w !xsel -i -b -l /dev/null<CR>
    nnoremap <silent> "+p :r!xsel -b<CR>
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap <Leader>f :FzfFiles<CR>
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>g :FzfGitFiles<CR>

" invoke omni completion by pressing ctrl+/ (ctrl+/ is recognized as C-_)        
" inoremap <nique> <C-_> <C-x><C-o><C-p>

nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"nnoremap <leader>jd :YcmCompleter GoTo<CR>
" Remove tralling ^M
nmap <leader>M :%s/\r\(\n\)/\1/g<CR>

""""""""""""""""""""""""""
" coc completion settings
""""""""""""""""""""""""""
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[v` and `]v` to navigate diagnostics
nmap <silent> [v <Plug>(coc-diagnostic-prev)
nmap <silent> ]v <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader><leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader><leader>t  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader><leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader><leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader><leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader><leader>r  :<C-u>CocListResume<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<C-j>"

"use omni complete for Go is tooo slow. I'll try YCM
"source ~/.vim/neocomplete.vim

" Fzf command prefix
let fzf_command_prefix = 'Fzf'

" Python jedi plugin config
"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#goto_command = "gd"
"let g:jedi#goto_assignments_command = "<leader>a"
""let g:jedi#documentation_command = "K"
""let g:jedi#usages_command = "<leader>n"
""let g:jedi#completions_command = "<C-Space>"
""let g:jedi#rename_command = "<leader>r"
"" Use YCM instead
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0

" Set Tagbar width
let tagbar_width = 32

" Use context to decide completion type
"let SuperTabDefaultCompletionType = "context"

" Add extra spaces when (un)commenting
let g:NERDSpaceDelims = 1
" Otherwise in python u will get 2 spaces after #
let g:NERDCustomDelimiters = {'python': {'left': '#'}}
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Vim-go plugin settings
"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC] (coc.vim)
let g:go_def_mapping_enabled = 0
"let g:go_code_completion_enabled = 1
let g:go_fmt_command = "goimports"
let go_highlight_functions = 1
let g:go_highlight_types = 1
let go_highlight_structs = 1
let go_highlight_operators = 1
let go_highlight_build_constraints = 1
"let go_highlight_methods = 1
"let go_fmt_fail_silently = 1

"frontend development for css,html
" use <Leader> instead of <C-y> 
" ,, expand html,css etc.
" ,/ comment html,css,scss,sass,less
" More :help emmet-customize 
"emmet mapping.
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
"let g:user_emmet_expandabbr_key = '<tab>'
"let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_leader_key = "<leader>"

"disable folding in markdown
"let g:vim_markdown_folding_disabled=1

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_args = '--ignore=E221,E501,E241,E251'
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" ale settings
let g:ale_python_flake8_options = '--ignore=E221,E501,E241,E251'

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"set output format for DOT graphs (default is pdf)
let g:WMGraphviz_output="svg"

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim-pathogen plugin 
"Vundle plugin manager
"vim-plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

call plug#begin('~/.vim/bundle')

"""""""""""""""""""""""""""""""""""""""
"Completion Engine
"""""""""""""""""""""""""""""""""""""""
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
"if has('nvim') || v:version >= 800
"    Plug 'w0rp/ale'
"else
"    Plug 'scrooloose/syntastic'
"endif
let g:coc_global_extensions = ['coc-json', 'coc-python']
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'w0rp/ale'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"""""""""""""""""""""""""""""""""""""""
"Common vim plugins
"""""""""""""""""""""""""""""""""""""""
" Match html tags using %
Plug 'vim-scripts/matchit.zip'
Plug 'itchyny/lightline.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
"Sorry I've never used this...
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"colorscheme
Plug 'altercation/vim-colors-solarized'
"rename files in vim
Plug 'qpkorr/vim-renamer'
Plug 'mkitt/tabline.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'

"""""""""""""""""""""""""""""""""""""""
" Plugins for specific languages
"""""""""""""""""""""""""""""""""""""""
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mattn/emmet-vim', { 'for': ['html','css','scss','sass','less'] }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" colorize terminal outputs in vim
Plug 'powerman/vim-plugin-AnsiEsc'
" graphviz integration to preview DOT graphs
Plug 'wannesm/wmgraphviz.vim'

"""""""""""""""""""""""""""""""""""""""
" Plugins need outer world dependencies.
"""""""""""""""""""""""""""""""""""""""
" https://vi.stackexchange.com/a/2577
if g:os == "Linux"
    Plug 'lilydjwg/fcitx.vim'
endif
"Plug 'Yggdroot/LeaderF'
"Alternative to LeaderF, can be used in terminal too.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme solarized
" Be compatible with transparent terminals under linux (tilda).
" If you are not using solarized theme for your terminal, comment out the
" following lines.
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Folded ctermbg=none
highlight LineNr ctermbg=none

autocmd FileType html,css,scss,sass,less EmmetInstall

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Configure default command used by :grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ -g\ \'!*.min.js\'
    set grepformat=%f:%l:%c:%m
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ --ignore=\"**.min.js\"
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ack')
    set grepprg=ack\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Open search results in quickfix and highlight matches
command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw! | copen

" Toggle signcolumn. Works only on vim>=8.0 or NewVim
" https://stackoverflow.com/questions/18319284/vim-sign-column-toggle/46636973#46636973
function! ToggleSignColumn()
    if !exists("w:signcolumn_on") || w:signcolumn_on
        set signcolumn=no
        let w:signcolumn_on=0
    else
        set signcolumn=auto
        let w:signcolumn_on=1
    endif
endfunction
