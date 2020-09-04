function! CoCPlugs(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    g:CocInstall coc-clangd "C++
    g:CocInstall coc-rome   "Javascript/Typescript
    g:CocInstall coc-go     "Golang
    g:CocInstall coc-rls    "Rustlang
    g:CocInstall coc-python "Pythong
  endif
endfunction
call plug#begin("~/.vim/plugged")

"  Plug 'pluginOwner/pluginNames'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin' 
  Plug 'ryanoasis/vim-devicons'

  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'mbbill/undotree'
  Plug 'preservim/nerdcommenter'
  
  Plug 'tpope/vim-surround'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Fun Start Screen
  Plug 'mhinz/vim-startify'
  " Language Plugins
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'LnL7/vim-nix'
  Plug 'majutsushi/tagbar'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ap/vim-css-color'
  " CoC LanguageClient Stuff
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('CoCPlugs') }
  " Web Technologies "
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'

  Plug 'mitsuhiko/vim-jinja'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()


