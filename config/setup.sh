#!/usr/bin/env bash

ln -s $PWD/nvim $HOME/.config/nvim

# NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -E   +PlugInstall +qall || echo "installed plugins" 

# Tmux
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Bash
ln -s $PWD/bash/bash_custom $HOME/.bash_custom
ln -s $PWD/bash/bash_funcs $HOME/.bash_funcs

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

# Emacs
ln -s $PWD/doom.d $HOME/.doom.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
~/.emacs.d/bin/doom doctor
systemctl --user enable emacs
systemctl --user start emacs
