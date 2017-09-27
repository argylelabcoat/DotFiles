
export PATH=/usr/local/anaconda3/bin:/Users/mhughes/bin:/Users/mhughes/.cargo/bin:"$PATH"
source (conda info --root)/etc/fish/conf.d/conda.fish



function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end

set -g theme_nerd_fonts yes

alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias nvlc="vlc -I ncurses $argv"
