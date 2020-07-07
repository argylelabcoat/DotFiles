#!/bin/sh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install flatpak podman zsh fish rxvt-unicode-256color gcc clang neovim \
python3-pip python3-virtualenv scons cmake subversion subversion-tools fossil mercurial git exuberant-ctags \
rsync rclone rclone-gui curl wget \
picom numlockx i3 i3bar i3lock yabar rofi alacritty \
zathura xfe ranger pass gnupg udiskie \
mpd mpc cantada pms pamix pactl \


pip3 install conan meson tmuxp httpie git-archive-all

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh 
chsh -s `which fish`
cp .vimrc ~/.vimrc
cp -r .vim ~/.vim
cp -r .fonts ~/.fonts
cp -r .themes ~/.themes
cp -r .ctags ~/.ctags

