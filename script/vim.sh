#!/bin/zsh

# install dracula vim color-scheme
if [ ! -d $HOME/.vim/colors/start/dracula ]; then
	mkdir -p $HOME/.vim/pack/themes/start
	git clone https://github.com/dracula/vim.git $HOME/.vim/pack/themes/start/dracula
fi

# dein.vim
if [ ! -d $HOME/.vim/bundles ]; then
	mkdir $HOME/.vim/bundles
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.vim/bundles/installer.sh
	. $HOME/.vim/bundles/installer.sh $HOME/.vim/bundles
fi

