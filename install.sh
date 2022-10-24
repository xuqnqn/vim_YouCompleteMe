#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim

cp vimrc ~/.vimrc
sudo cp sourceInsight.sh /usr/bin/
sudo apt-get install cscope exuberant-ctags
#sudo apt-get install vim-gnome
#sudo apt-get install vim-gtk
