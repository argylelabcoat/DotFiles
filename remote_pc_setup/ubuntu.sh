#!/usr/bin/env sh
# install software:
sudo apt install neovim tmux bash zsh fish dos2unix git wget curl htop python3-pip
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# get config
git clone https://github.com/argylelabcoat/DotFiles
cd DotFiles/remote_pc_setup

# NeoVim
curl -fLo "$HOME/.local/share"/nvim/site/autoload/plug.vim --create-dirs  \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

nvim -E   +PlugInstall +qall || echo "installed plugins" 

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf

# Bash
cat >> ~/.inputrc <<'EOF'

"\e[A": history-search-backward
"\e[B": history-search-forward

EOF


cat >> ~/.bashrc <<'EOF'
export EDITOR=$(which nvim)

# Historical Arrows:
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

EOF


# copy configs
cp -R DotFiles/config/fish/ ~/.config/
cp DotFiles/config/tmux.conf.local ~/.tmux.conf.local
cp DotFiles/config/tmux.conf ~/.tmux.conf
