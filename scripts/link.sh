#!/bin/zsh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

cd ${dotfiles_root}/dotfiles

for f in .??*
do
    ln -s ${PWD}/${f} ${HOME}
done

