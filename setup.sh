#!/bin/bash

if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew bundle

ln -fnsv $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -fnsv $HOME/dotfiles/.tmux $HOME/.tmux
ln -fnsv $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -fnsv $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -fnsv $HOME/dotfiles/.config/fish $HOME/.config/fish

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi
