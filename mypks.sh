#!/bin/sh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh dkms vim-gtk rxvt-unicode-256color openjdk-7-jdk openjdk-7-jre gcc clang geany \
python-pip scons ruby subversion subversion-tools mercurial git curl exuberant-ctags 

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh 
chsh -s `which zsh`
cp .vimrc ~/.vimrc
cp -r .vim ~/.vim
cp -r .fonts ~/.fonts
cp -r .themes ~/.themes
cp -r .ctags ~/.ctags

