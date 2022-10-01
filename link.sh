#!/bin/bash
DOTFILES=$PWD/configs

ln -vs $DOTFILES/vimrc ~/.vimrc
ln -vs $DOTFILES/bash_aliases ~/.bash_aliases
ln -vs $DOTFILES/gitconfig ~/.gitconfig
