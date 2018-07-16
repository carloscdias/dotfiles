#!/bin/bash

FILES=".gitconfig .vimrc .tmux.conf .vim"
DIRECTORY="$1"
VIMPLUGINS="git@github.com:kien/ctrlp.vim.git
git@github.com:mattn/emmet-vim.git
git@github.com:scrooloose/nerdtree.git
git@github.com:Townk/vim-autoclose.git
git@github.com:tpope/vim-fugitive.git
git@github.com:airblade/vim-gitgutter.git"

cp -r $FILES $DIRECTORY

for plugin in $VIMPLUGINS
do
  plugindir=$(echo $plugin | sed -n 's/.*\/\(.*\)\.git/\1/p')
  echo $plugindir
  git clone $plugin ${DIRECTORY}/.vim/bundle/$plugindir/
done

