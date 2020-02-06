#!/bin/bash

# Save old configs
mkdir dotfiles-setup-bkp
cp -r ~/.gitconfig ~/.vimrc ~/.tmux.conf ~/.vim dotfiles-setup-bkp

# Copy new dot files
cp -r .gitconfig .vimrc .tmux.conf $HOME

# Installing Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Creating colors directory
mkdir -p ~/.vim/colors
# Downloading theme
curl https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -o ~/.vim/colors/monokai.vim
# Installing all plugins
vim +PluginInstall +qall
