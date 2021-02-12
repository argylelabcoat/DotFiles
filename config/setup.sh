#!/usr/bin/env bash

# NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -E   +PlugInstall +qall || echo "installed plugins" 

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf
cp tmux.conf.local ~/.tmux.conf.local

# Bash
cat >> ~/.inputrc <<'EOF'
"\e[A": history-search-backward
"\e[B": history-search-forward
EOF

cat >> ~/.bashrc <<'EOF'
export EDITOR=$(which nvim)
eval "$(starship init bash)"
source /etc/profile.d/nix.sh
eval "$(direnv hook bash)"
EOF


#git config --global user.email "matthew@localhost"
git config --global user.name "Matthew Hughes"
git config --global core.editor "nvim"

