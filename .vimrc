"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"
" synchronous scroll
" :set scrollbind
"
" Render OpenAPI/Swagger
" :CocCommand swagger.render
"
" Show Language Server Output
" :CocCommand workspace.showOutput
"
" C-V m to input ^M
"
" Examine specific key mapping in vim:
" verbose map <leader>s

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
set completeopt=longest,menuone,popup

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
set relativenumber

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

" Toggle by <Leader>x
"set cursorcolumn
"set cursorline

set signcolumn=number

"""""""""""""""""""""""""
" coc compatible settings
"""""""""""""""""""""""""
" Better display for messages. Don't need this any more since vim now supports floating window.
" set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors & Style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlight
" The ':syntax enable' command will keep your current color settings.  This
" allows using ':highlight' commands to set your preferred colors before or
" after using this command.  If you want Vim to overrule your settings with the
" defaults, use: ':syntax on'
" syntax on
syntax enable

" enable true color in vim
if has('termguicolors')
    set termguicolors
endif

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

" support italic font
" set t_ZH=[3m
" set t_ZR=[23m
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" let g:gruvbox_material_disable_italic_comment = 1
" let g:palenight_terminal_italics=1


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
autocmd FileType proto setl shiftwidth=2 softtabstop=2
autocmd FileType cpp setl noexpandtab shiftwidth=4 tabstop=4
autocmd FileType yaml setl shiftwidth=2 softtabstop=2

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

" Treat starlark files as python
autocmd BufRead,BufNewFile *.star set filetype=python

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

" Toggle display line number
nnoremap <Leader>2 :set number!<CR>:set relativenumber!<CR>:call ToggleSignColumn()<CR>
    " Toggle signcolumn. Works only on vim>=8.0 or NewVim
    " https://stackoverflow.com/questions/18319284/vim-sign-column-toggle/46636973#46636973
    function! ToggleSignColumn()
        if !exists("w:signcolumn_on") || w:signcolumn_on
            set signcolumn=no
            let w:signcolumn_on=0
        else
            set signcolumn=number
            let w:signcolumn_on=1
        endif
    endfunction

nnoremap <Leader>3 :set foldenable!<CR>

" Paste toggle
set pastetoggle=<Leader>4

" Save & Make 
" nnoremap <Leader>5 :w<CR>:make!<CR>
" nnoremap <Leader>6 :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" Quickfix and Location window
nnoremap <Leader>7 :botright copen<CR>
nnoremap <Leader><Leader>7 :lopen<CR>
nnoremap <Leader>8 :cclose<CR>
nnoremap <Leader><Leader>8 :lclose<CR>
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprevious<CR>
nnoremap <Leader><Leader>n :lnext<CR>
nnoremap <Leader><Leader>p :lprevious<CR>

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Use xsel to access the X clipboard
if $DISPLAY != '' && executable('xsel')
    nnoremap <silent> "*y :'[,']w !xsel -i -p -l /dev/null<CR>
    nnoremap <silent> "*p :r!xsel -p<CR>
    nnoremap <silent> "+y :'[,']w !xsel -i -b -l /dev/null<CR>
    nnoremap <silent> "+p :r!xsel -b<CR>
endif

" invoke omni completion by pressing ctrl+/ (ctrl+/ is recognized as C-_)        
" inoremap <nique> <C-_> <C-x><C-o><C-p>

nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>

" Remove tralling ^M
nmap <leader>M :%s/\r\(\n\)/\1/g<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
" call :g/^Plug to filter plugins installed
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim-plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

call plug#begin('~/.vim/bundle')

"""""""""""""""""""""""""""""""""""""""
" coc.nvim completion engine
"""""""""""""""""""""""""""""""""""""""
    let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-pyright',
        \ 'coc-imselect',
        \ 'coc-tsserver',
        \ 'coc-swagger'
        \ ]

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
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
    nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
    nmap <silent> ge :call CocAction('jumpDefinition', 'tabe')<CR>
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader><leader>f  <Plug>(coc-format-selected)

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Remap for do codeAction of current line
    nmap <leader>d  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)
    " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    " https://github.com/neoclide/coc.nvim/issues/1089
    "nmap <silent> <TAB> <Plug>(coc-range-select)
    "xmap <silent> <TAB> <Plug>(coc-range-select)
    "xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <leader>t  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <leader>e  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

    " Scroll float window via ctrl-b & ctrl-f.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""""""""""""""""""""""""""""""""""""
" Fzf fuzzy finder
"""""""""""""""""""""""""""""""""""""""
    let fzf_command_prefix = 'Fzf'
    " Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new
    "   tab, a new split, or in a new vertical split
    nnoremap <Leader>f :FzfFiles<CR>
    nnoremap <Leader>b :FzfBuffers<CR>
    nnoremap <Leader>h :FzfHistory<CR>
    nnoremap <Leader>v :FzfGitFiles<CR>
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

    " Awesome search plugin using ag/rg/ack
    nmap     <C-S>s <Plug>CtrlSFPrompt
    vmap     <C-S>s <Plug>CtrlSFVwordPath
    vmap     <C-S>f <Plug>CtrlSFVwordExec
    nmap     <C-S>n <Plug>CtrlSFCwordPath
    nmap     <C-S>p <Plug>CtrlSFPwordPath
    nnoremap <C-S>o :CtrlSFOpen<CR>
    nnoremap <C-S>t :CtrlSFToggle<CR>
    inoremap <C-S>t <Esc>:CtrlSFToggle<CR>

    " tasks grep. '-R' to enable regex search
    nnoremap <Leader><Leader>t :CtrlSF -R TODO\|FIXME\|XXX
Plug 'dyng/ctrlsf.vim'

""""""""""""""""""""""""""""""""""""""
" Git integration
""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

    " <Leader>gm to show popup window
    " | Mapping | Description                                                  |
    " | ------- | ------------------------------------------------------------ |
    " |    q    | Close the popup window                                       |
    " |    o    | 'o'lder. Back to older commit at the line                    |
    " |    O    | Opposite to older. Forward to newer commit at the line       |
    " |    d    | Toggle unified diff hunks only in current file of the commit |
    " |    D    | Toggle all unified diff hunks of the commit                  |
    " |    r    | Toggle word diff hunks only in current file of the commit    |
    " |    R    | Toggle all word diff hunks of the commit                     |
    " |    ?    | Show mappings help                                           |
    " let g:git_messenger_close_on_cursor_moved = v:false
    let g:git_messenger_always_into_popup = v:true
    " does not work for git-messenger, (pedit / pclose is ok)
    " set previewpopup=height:10,width:60,border:off
Plug 'rhysd/git-messenger.vim'


""""""""""""""""""""""""""""""""""""""
" colorscheme and statusline
""""""""""""""""""""""""""""""""""""""
    " Available values: 'hard', 'medium'(default), 'soft'
    let g:gruvbox_material_background = 'hard'
    " let g:gruvbox_material_palette = 'original'
    let g:gruvbox_material_transparent_background = 1
    " Available values: 'grey background', 'green background', 'blue background', 'red background', 'reverse'
    let g:gruvbox_material_visual = 'reverse'
    " Available values: 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
    let g:gruvbox_material_menu_selection_background = 'green'
    let g:gruvbox_material_diagnostic_line_highlight = 1
    " Available values: `'grey background'`, `'bold'`, `'underline'`, `'italic'`
    " Default value: `'grey background'` when not in transparent mode, `'bold'`
    " when in transparent mode.
    " let g:gruvbox_material_current_word = 'bold'
    let g:gruvbox_material_better_performance = 1
Plug 'sainnhe/gruvbox-material'
" Plug 'altercation/vim-colors-solarized'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'arcticicestudio/nord-vim'

    " colorscheme settings
    let g:lightline = {'colorscheme': 'gruvbox_material'}
Plug 'itchyny/lightline.vim'

"""""""""""""""""""""""""""""""""""""""
" other plugins
"""""""""""""""""""""""""""""""""""""""
packadd! matchit
Plug 'Lokaltog/vim-easymotion'

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }

    " Set Tagbar width
    let tagbar_width = 32
    " Toggle Tagbar, more convenient than TList
    nnoremap <silent> <Leader>9 :TagbarToggle<CR>
Plug 'majutsushi/tagbar'

    " NERDTreeTabsToggle
    " This need nerdtree and nerdtreetabs both installed, press t to open the file
    " in a new tab, press ENTER to open in the current window.
    "nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
    nnoremap <silent> <Leader>1 :NERDTreeToggle<CR>
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

    " Add extra spaces when (un)commenting
    let g:NERDSpaceDelims = 1
    " Otherwise in python u will get 2 spaces after #
    let g:NERDCustomDelimiters = {'python': {'left': '#'}}
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
Plug 'scrooloose/nerdcommenter'

" rename files in vim
Plug 'qpkorr/vim-renamer'
Plug 'mkitt/tabline.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'

"Enhanced quickfix window such as opening in new tab, vertical split.
"<Leader><Enter> vopen, <Leader><Space> hopen, <Leader><Tab> topen
Plug 'yssl/QFEnter'

if !has('nvim')
Plug 'rhysd/vim-healthcheck'
endif

"""""""""""""""""""""""""""""""""""""""
" Plugins for specific languages
"""""""""""""""""""""""""""""""""""""""
    let g:vim_markdown_no_default_key_mappings = 1
Plug 'plasticboy/vim-markdown'

Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'mattn/vim-goimports'

    " Vim-go plugin settings
    let g:go_def_mapping_enabled = 0
    let g:go_code_completion_enabled = 0
    let g:go_doc_keywordprg_enabled = 0
    " replaced by coc.nvim via editor.action.organizeImport
    "let g:go_fmt_autosave = 1
    let g:go_fmt_command = "goimports"
    let go_highlight_functions = 1
    let g:go_highlight_types = 1
    let go_highlight_structs = 1
    let go_highlight_operators = 1
    let go_highlight_build_constraints = 1
    "let go_fmt_fail_silently = 1
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" colorize terminal outputs in vim
    " Disable AnsiEsc's key mapping (<leader>s)
    let g:no_cecutil_maps = 1
Plug 'powerman/vim-plugin-AnsiEsc'

" graphviz integration to preview DOT graphs
    "set output format for DOT graphs (default is pdf)
    let g:WMGraphviz_output="svg"
Plug 'wannesm/wmgraphviz.vim'

"""""""""""""""""""""""""""""""""""""""
" Plugins need outer world dependencies.
"""""""""""""""""""""""""""""""""""""""
" https://vi.stackexchange.com/a/2577
if g:os == "Linux"
Plug 'lilydjwg/fcitx.vim'
endif


call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" using autocmd may cause a `flick` in switching colorschemes
" autocmd vimenter * ++nested colorscheme gruvbox-material
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
"
colorscheme gruvbox-material
"" Be compatible with terminals with transparency
"" https://stackoverflow.com/questions/37712730/set-vim-background-transparent
" This is now handled by via `let g:gruvbox_material_transparent_background = 1`
"hi Normal guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE

"" CocHilightText links to CurrentWord
"" give a higher contrast
" hi CurrentWord guifg=#7daea3


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
