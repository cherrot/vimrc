#My vim config file mainly for web developer
I use vim to write markdown, python, ruby, Erlang/Elixir, php, javascript, C, C++, bla bla bla...

## Usage
1. checkout this repo to ~/.vim

        git clone https://github.com/cherrot/vimrc.git ~/.vim
2. create plugin directory and install plugin manager `Vundle`:

        mkdir ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. create a soft link under ~/ to ~/.vim/.vimrc:

        ln -sf ~/.vim/.vimrc ~/
4. run `vim`, I know there would be some errors, just press any key to ignore that this time. 
run `:PluginInstall` to install all the requirements.
5. After somedays you could run `:PluginUpdate` to update all the installed plugins.
5. restart your `vim` and **welcome to the new world!**

## Typical workflow
1. First `cd` to your project's root directory
2. open a source file using `vim`
3. To enable code auto-completing you may type `<Leader>=` (In my case, `,=`) to build index files for `ctags` and `cscope`
4. I use jedi to auto-complete python code, sometimes it is not as smart as you expect it to be, then you could type `ctrl-x ctrl-n` to enable `cscope`'s auto-completing.
