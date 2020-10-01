# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

ZSHHOME="$HOME/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
	for i in $ZSHHOME/*; do
		. $i
	done
fi

