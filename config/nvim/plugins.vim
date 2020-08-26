call plug#begin("~/.vim/plugged")

"  Plug 'pluginOwner/pluginNames'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin' 
  Plug 'ryanoasis/vim-devicons'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'mbbill/undotree'
  Plug 'preservim/nerdcommenter'
  
  Plug 'tpope/vim-surround'
  Plug 'ap/vim-css-color'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'mhinz/vim-startify'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'majutsushi/tagbar'
  Plug 'editorconfig/editorconfig-vim'
" Web Technologies
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'

  Plug 'mitsuhiko/vim-jinja'
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1
