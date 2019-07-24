# My Vim config for developers

This is a Vim config (`.vimrc`) for NeoVim, Vim 8 and Vim 7.3+

## Table of Contents
2. [Plugins and Custom Key Mappings](#plugins-and-custom-key-mappings)
3. [Installation](#installation)
4. [Additional Notes](#additional-notes)
5. [FAQ](#faq)
    1. [Why the color scheme looks so terrible on my terminal?](#256-color)

<a name="plugins-and-custom-key-mappings"></a>
## Plugins and Custom Key Mappings

`<Leader>` key is mapped to `,` for convenience.

### For Developers

- [coc.nvim][coc]: Intellisense engine for vim8 & neovim, full language server protocol support as VSCode. Check its documents to gain full power of it.
- [ALE][ale]: A realtime linter, which benefits from the asynchronous feature of NeoVim and Vim 8. `ALE` is a helpful complement to `coc.nvim`.
- [nerdcommenter][nerdcommenter]: Comment/Uncomment your code with `<Leader>cc`, `<Leader>c<Space>`, etc.
- [vim-easy-align][easyalign]: I have mapped `ga` to align code in normal and visual mode. For example, you can align a block of JSON map with `:` via `vipga:` or `gaip:`. Check the plugin's document for details.
- [vim-fugitive][fugitive] and [vim-signify][signify] give a git integration. You can invoke most git commands in Vim via `fugitive`'s pre-defined functions, e.g. `:Gblame`, `:Glog`, `:Gdiff`, and you can continue operating on the result interactively via some hotkeys. When you open or save a buffer (file), `vim-signify` would indicate the differences from your VCS and you can jump among them via `[c` and `]c` (just like when you use `vimdiff`).
- `K` is the best way to check document of the current word.
- `<Leader>t` is a convenient wrapper to grep `TODO|FIXME|XXX` in current directory.

### Navigation Related

- [fzf][fzf] is my favorite fuzzy finder, before it I haved tried [ctrlp][ctrlp] and [leaderF][leaderF], neither of them was **fast** enough or bug free to use. Furthermore, `fzf` is integrated in your terminal by nature. I've mapped `<Leader>f`, `<Leader>b`, `<Leader>m` and `<Leader>g` to find in Files, Buffers, Modification history and Git files. Use `<Ctrl>X`, `<Ctrl>V`, `<Ctrl>T` to open target file in a new window or tab.
- [vim-easymotion][easymotion] could be useful when you need quickly jump to somewhere in Vim. Take `<Leader><Leader>w` for a try.
- [vim-bookmarks][vim-bookmarks] maps keys to mark a line (`mm`), insert some notes (`mi`), jump among markers (`mn`, `mp`) and show all markers (`ma`)
- `<Ctrl-o>`, `<Ctrl-i>` to jump back and forth in the current buffer.
- Window operations:
    - `<Ctrl-w>s`, `<Ctrl-w>v` to split a window.
    - `<Ctrl-h>`, `<Ctrl-j>`, `<Ctrl-k>`, `<Ctrl-l>` to navigate among windows.
    - `<Ctrl-H>`, `<Ctrl-J>`, `<Ctrl-K>`, `<Ctrl-L>` to expand the current window.
    - `<Ctrl-w>=`, `<Ctrl-w>+`, `<Ctrl-w>-`, `<Ctrl-w> <`, `<Ctrl-w> >` to adjust window size. (You can prepend a NUM like using a motion commond)
- Tab operations:
    - `to`, `tc` to open and close a tab.
    - `tp`, `tn` to switch back and forth (just like `gT` and `gt`).
    - `NUM gt` to go to the `NUM`th tab.
- `gf` to open a path (including URL) in Vim quickly.

### Others

- [vim-plug][vim-plug]: A super fast plugin manager. Run `:PlugInstall`, `:PlugUpdate` to install and update plugins in parallel.
- [vim-airline][vim-airline] enhances Vim's status line. It also works well with other plugins.
- `<Leader>1` to toggle tree view of project files. Check `:help NERDTreeMappings` for its usage.
- `<Leader>2` to toggle number.
- `<Leader>3` to toggle foldenable for the current buffer, use `<space>` to fold a single block.
- `<Leader>4` to toggle paste mode.
- `<Leader>5` and `<Leader>6` is used to `make` a project.
- `<Leader>7` and `<Leader>8` to open and close quickfix window, `<Leader>p` and `<Leader>n` to jump back and forth. As for location list, just prepend another `<Leader>` key, for example: `<Leader><Leader>7` to open the location list window.
- `<Leader>9` to toggle [Tagbar][tagbar]
- `<Leader>0` to grep the current word and `<Leader><Leader>0` to invoke a plain grep command.
- `<Leader>/` to disable highlight search.

Please check the `Mappings` section in `.vimrc` and plugins' manual for more information :)

<a name="installation"></a>
## Installation

Before cloning this repo, you need to install some external dependencies:

- `:grep` needs either [ripgrep][ripgrep] or [the_silver_searcher][silver] for a faster grep
- [Tagbar][tagbar] depends on `ctags` for code parsing:

```bash
# On MacOS with Homebrew:
brew install cmake, ctags, ripgrep

# On Arch Linux:
sudo pacman -S cmake ctags ripgrep

# On Ubuntu Linux >= 13.10(Saucy):
sudo apt-get install cmake exuberant-ctags silversearcher-ag
```

(Other binary dependencies such as `vim-go` and `fzf` would be updated automatically during plugin update.)

Clone this repository into `~/.vim`:

```bash
git clone https://github.com/cherrot/vimrc.git ~/.vim
ln -sf ~/.vim/.vimrc ~/
```

If you use [NeoVim](https://neovim.io/) like me, then you may check [`:help nvim-from-vim`][nvim-from-vim] to enable this `vimrc`. (Only 3 lines config is needed!)

Now you could run `vim` in your terminal. It will check and install all the plugins it needs.
Ignore the color scheme error for now (It should be fixed on your next start). This process will take a few minutes depending on your network bandwidth and CPU. Be patient :)

Now you can restart your Vim and **welcome to the new world!**

<a name="additional-notes"></a>
## Additional Notes

- (ArchLinux) If you get an error about `libtinfo`, you may need to install `ncurses5-compat-libs` via AUR.
- If you want a python PEP8 lint, you need `flake8` installed via `pip` systemwide or under your virtualenv only.


<a name="faq"></a>
## FAQ

<a name="256-color"></a>
### Why the color scheme looks so terrible on my terminal?

Make sure your ternimal is `256-color`. Run `echo $TERM` in your terminal,
it should be either `xterm-256color` or `screen-256color`. If not, you need set it to your 
terminal profile or export the environment variable.


[nvim-from-vim]: https://neovim.io/doc/user/nvim.html#nvim-from-vim
[coc]: https://github.com/neoclide/coc.nvim "Intellisense engine for vim8 & neovim, full language server protocol support as VSCode"
[vim-plug]: https://github.com/junegunn/vim-plug "vim-plug: Minimalist Vim Plugin Manager"
[vim-airline]: https://github.com/bling/vim-airline
[fzf]: https://github.com/junegunn/fzf "fzf: A command-line fuzzy finder written in Go"
[ctrlp]: https://github.com/ctrlpvim/ctrlp.vim
[leaderF]: https://github.com/Yggdroot/LeaderF
[easymotion]: https://github.com/Lokaltog/vim-easymotion
[easyalign]: https://github.com/junegunn/vim-easy-align
[ag]: https://github.com/rking/ag.vim
[silver]: https://github.com/ggreer/the_silver_searcher
[tagbar]: https://github.com/majutsushi/tagbar
[neocomplete]: https://github.com/Shougo/neocomplete.vim
[ripgrep]: https://github.com/BurntSushi/ripgrep
[vim-go]: https://github.com/fatih/vim-go
[ale]: https://github.com/w0rp/ale
[nerdtree]: https://github.com/scrooloose/nerdtree
[fugitive]: https://github.com/tpope/vim-fugitive
[signify]: https://github.com/mhinz/vim-signify
[vim-bookmarks]: https://github.com/MattesGroeger/vim-bookmarks
[nerdcommenter]: https://github.com/scrooloose/nerdcommenter
