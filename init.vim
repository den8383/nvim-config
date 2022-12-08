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
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
let g:indentLine_conceallevel = 0
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
let g:coc_global_extensions = ['coc-pairs','coc-json', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-eslint','coc-styled-components','coc-go', 'coc-pyright', 'coc-clangd', 'coc-docker']


"personal settings
set number
set signcolumn=number
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
inoremap <C-o> <Esc>o
noremap <S-h> ^
noremap <S-l> $

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd : sp<CR><Plug>(coc-definition):wincmd p<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gt :call <SID>split_jump()<CR><CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


function! s:split_jump()
  !tmux split-window -v && tmux send-keys 'vim %' C-m
  bd %
endfunction




colorscheme solarized
syntax on
set t_Co=256
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
highlight SignColumn ctermbg=none

