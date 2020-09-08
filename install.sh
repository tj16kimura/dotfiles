#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -s $HOME/dotfiles/$f $HOME/$f
done

if [ ! -d $HOME/.vim/colors/start/dracula ]; then
	mkdir -p $HOME/.vim/pack/themes/start
	git clone https://github.com/dracula/vim.git $HOME/.vim/pack/themes/start/dracula
fi

