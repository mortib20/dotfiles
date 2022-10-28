#!/bin/bash
DOTFILES=$PWD/configs
AURS=$PWD/aur/Aur.sh

ln -vs $DOTFILES/vimrc ~/.vimrc
ln -vs $DOTFILES/bash_aliases ~/.bash_aliases
ln -vs $DOTFILES/gitconfig ~/.gitconfig

if [ -f "/etc/arch-release" ]
then
	echo "Arch Linux Detected - linking AUR Script"
	ln -vs $AURS ~/Aur.sh
fi

if [ -f ~/.bashrc ]
then
	echo "Dont forget to add - source .bash_aliases - so aliases work"
fi
