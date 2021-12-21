:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set noshowmode

"Plugins
call plug#begin()

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'haishanh/night-owl.vim'

call plug#end()

set encoding=UTF-8
colorscheme nord
let g:airline_powerline_fonts=1
set encoding=UTF-8
