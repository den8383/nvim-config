"vim-plug: automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug: plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'

Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
call plug#end()

"vim-plug: automatic installation of missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"LSP settings
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-eslint','coc-styled-components','coc-go', 'coc-pyright', 'coc-clangd', 'coc-docker']

"personal settings
set number
set title
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus


inoremap <C-h> <Esc>ha
inoremap <C-j> <Esc>ja
inoremap <C-k> <Esc>ka
inoremap <C-l> <Esc>la
inoremap <C-o> <Esc><Esc>o
inoremap <C-S-o> <Esc><Esc><S-o>
noremap <S-h> ^
noremap <S-l> $

colorscheme solarized
syntax on
set t_Co=256
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
