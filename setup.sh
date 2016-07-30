#!/bin/bash

DOTFILES=(.tmux .tmux.conf .vimrc .zshrc)

for file in ${DOTFILES[@]}
do
  ln -fnsv $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.zplug ]; then
  curl -sL zplug.sh/installer | zsh
fi
