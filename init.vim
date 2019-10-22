" Fgneg cyhtvaf urer.
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'HerringtonDarkholme/yats.vim' " Yats for typescript syntax highlight
Plug 'sheerun/vim-polyglot' " Polyglot for every syntax highlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'

call plug#end()

let mapleader = "\\"

" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" Maps the NERDTree file list. Auto open if no file selected.
map <leader>r :source $MYVIMRC<CR>
map <leader>i :PlugInstall<CR>
map <C-p> :FZF<CR>

inoremap jk <ESC>

if (has("termguicolors"))
	set termguicolors
endif

set rtp+=/usr/bin/fzf
set number
set relativenumber 
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*dist*,*build*
set tabstop=2 shiftwidth=2 expandtab

" Format code.
autocmd FileType python nnoremap <buffer> <leader>f :YAPF<CR>
autocmd FileType css,javascript,typescript nnoremap <buffer> <leader>f :PrettierAsync<CR>
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml PrettierAsync
" autocmd BufWritePre *.py YAPF

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>a :CocAction<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <S-n> <Plug>(coc-diagnostic-prev)
nmap <silent> <S-N> <Plug>(coc-diagnostic-next)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

syntax on
colorscheme onedark

let g:deoplete#enable_at_startup=1
let g:airline_theme='onedark'
let g:airline#extensions#coc#enabled = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:polyglot_disabled = ['typescript']

