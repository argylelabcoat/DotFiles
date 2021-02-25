#!/usr/bin/env bash

cp -r nvim ~/.config/

# NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -E   +PlugInstall +qall || echo "installed plugins" 

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf
cp tmux.conf.local ~/.tmux.conf.local

cp bash/bash_custom ~/.bash_custom
cp bash/bash_funcs ~/.bash_funcs

# Bash
cat >> ~/.inputrc <<'EOF'
"\e[A": history-search-backward
"\e[B": history-search-forward
EOF

cat >> ~/.bashrc <<'EOF'
source $HOME/.bash_custom
source $HOME/.bash_funcs
EOF


#git config --global user.email "matthew@localhost"
git config --global user.name "Matthew Hughes"
git config --global core.editor "nvim"

