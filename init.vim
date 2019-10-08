" Start plugins here.
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

" Maps the NERDTree file list. Auto open if no file selected.
map <S-f> :NERDTreeToggle<CR>
map <S-o> :FZF<CR>
map <S-r> :source $MYVIMRC<CR>
map <S-i> :PlugInstall<CR>

if (has("termguicolors"))
	set termguicolors
endif

set rtp+=/usr/bin/fzf
set number
set relativenumber 

syntax on
colorscheme onedark

let g:deoplete#enable_at_startup=1
let g:airline_theme='onedark'
