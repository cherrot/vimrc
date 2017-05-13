# My vim config for developers

This is a config for Vim, integrated with `Go`,`Python`,`Elixir`,`Javascript`,`HTML&CSS` and `Markdown` languages by default.
Tested on OS X and Linux (specifically, Ubuntu and ArchLinux) with Vim version >= `7.3`.

## Feature

1.  [YouCompleteMe][ycm] & [syntastic][syntastic] for code-completion and syntax checking: fast and easy to use.
2.  [vim-plug][vim-plug] for plugin management: Super-fast parallel installation/update.
3.  [fzf][fzf] as a fuzzy finder, I haved tried [ctrlp][ctrlp] and [leaderF][leaderF], neither of them
is **fast** enough or bug free to use. And even more, `fzf` could be integrated with your terminal (bash and zsh)!
4.  [vim-airline][vim-airline]. No need to install new fonts (compared to [powerline][powerline]).
5.  [vim-easymotion][easymotion] and [vim-easy-align][easyalign]. You will love them ;)
6.  [tpope/vim-fugitive][git-plug] for git integration. You can invoke common git commands by `:Gblame`, `:Glog`, `:Gdiff`, etc.
7.  `<Leader>` key is mapped to `,` because it is used so frequently.

## Install

1.  This configuration has some external dependencies. 
Concretely, Compiling [YCM][ycm] needs `cmake` to be installed; `:grep` needs either [ripgrep][ripgrep] or
[the_silver_searcher][silver] for a fast grep, [tagbar][tagbar] depends on `ctags` for code parsing.  
Other binary dependencies such as `vim-go` and `fzf` would be downloaded and installed automatically for you.  
To install them on OSX:

    ```bash
    brew install cmake, ctags, ripgrep
    ```

    On Arch Linux :

    ```bash
    pacman -S cmake ctags ripgrep
    ```

    Or on Ubuntu Linux >= 13.10(Saucy):

    ```bash
    apt-get install cmake exuberant-ctags silversearcher-ag
    ```

2.  Clone this repository:

    ```bash
    git clone https://github.com/cherrot/vimrc.git ~/.vim
    ln -sf ~/.vim/.vimrc ~/
    ```

3.  Run vim in your terminal. It will check and download all the plugins it needs.
Wait for a moment and ignore the color scheme error for now (It should be fixed on your next start).

4.  Compile YCM, with `clang` and `Go` completer (if you need):

    ``` bash
    cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --clang-completer --gocode-completer
    ```

This process will take a while depending on your network bandwidth and CPU. Take some patience :)

5. Restart your vim and **welcome to the new world!**

### Notes

- (ArchLinux) If you get an error about `libtinfo`, you may need to install `ncurses5-compat-libs` via the AUR.
- If you want a python PEP8 lint, you need `flake8` installed via `pip` systemwide or under your virtualenv only.

## Typical workflow

Read the `Mappings` section of my `.vimrc`.

For further usage, check the documents of the specific plugins.

## FAQ

### Why the color scheme looks so terrible on my terminal?

Make sure your ternimal is `256-color`. Run `echo $TERM` in your terminal,
it should either be `xterm-256color` or `screen-256color`. If not, you need set it to your 
terminal profile or export the environment variable.

### Why switch to YouCompleteMe?
I have been using [neocomplete][neocomplete] for a long time. I like it becauce it is simple to setup,
and it dose not have external dependencies. But neocomplete is too slow in `Go`'s auto-completion.
Then I find YCM is easy enough to setup and use now, so it's time to say goodbye to neocomplete.

### cscope.vim?

Aha, it is deprecated. Maybe I'll remove it from this repo in some day.


[ycm]: https://github.com/Valloric/YouCompleteMe "YouCompleteMe: A code-completion engine for Vim"
[syntastic]: https://github.com/scrooloose/syntastic
[vim-plug]: https://github.com/junegunn/vim-plug "vim-plug: Minimalist Vim Plugin Manager"
[vundle]: https://github.com/gmarik/Vundle.vim
[vim-airline]: https://github.com/bling/vim-airline
[fzf]: https://github.com/junegunn/fzf "fzf: A command-line fuzzy finder written in Go"
[ctrlp]: https://github.com/ctrlpvim/ctrlp.vim
[leaderF]: https://github.com/Yggdroot/LeaderF
[powerline]: https://github.com/powerline/powerline
[easymotion]: https://github.com/Lokaltog/vim-easymotion
[easyalign]: https://github.com/junegunn/vim-easy-align
[ag]: https://github.com/rking/ag.vim
[silver]: https://github.com/ggreer/the_silver_searcher
[tagbar]: https://github.com/majutsushi/tagbar
[neocomplete]: https://github.com/Shougo/neocomplete.vim
[ripgrep]: https://github.com/BurntSushi/ripgrep
