#My vim config file mainly for web developer
I use vim to write markdown, python, Elixir, go, ruby, php, javascript,
C, C++, and blah blah blah...

## Usage
0. Make sure your ternimal is 256-color.

        echo $TERM 
        # should be xterm-256color or screen-256color
        # if not, run the following commands:
        echo 'export TERM=xterm-256color' >> ~/.bashrc  # or ~/.zshrc if you use zsh
        export TERM=xterm-256color
1. clone this repo to ~/.vim

        git clone https://github.com/cherrot/vimrc.git ~/.vim
2. create plugin directory and install plugin manager `Vundle`:

        mkdir ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. create a soft link `~/.vimrc`:

        ln -sf ~/.vim/.vimrc ~/
4. run `vim`, I know there would be some errors, just press any key to ignore
that this time. 
5. run `:PluginInstall` to install all the requirements.
5. restart your `vim` and **welcome to the new world!**
5. After somedays you may run `:PluginUpdate` to update all the installed
plugins.

P.S. Please take a look at my `.vimrc` to make full use of it. (especially my
key bindings and plugins).

## Typical workflow
1. First `cd` to your project's root directory
2. open a source file using `vim`
3. To enable code auto-completing you may type `<Leader>=` (In my case, `,=`)
to build/rebuild tag index files for `ctags` and `cscope`. (Of course you need
install them first)
4. I use `jedi` to auto-complete python code, so you don't need to build tag
files for a python project. but sometimes it is not as smart as you expect it
to be, then you may type `ctrl-x ctrl-n` to enable generic auto-completing.
