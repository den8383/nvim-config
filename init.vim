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

syntax on
set t_Co=256
colorscheme solarized
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
