#!/usr/bin/env sh
# install software:
sudo apt install neovim tmux bash zsh fish dos2unix git wget curl htop python3-pip
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
# get config
git clone https://github.com/argylelabcoat/DotFiles
# copy configs
cp -R DotFiles/config/fish/ ~/.config/
cp DotFiles/config/tmux.conf.local ~/.tmux.conf.local
cp DotFiles/config/tmux.conf ~/.tmux.conf
