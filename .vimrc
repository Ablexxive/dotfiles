set number
set background=dark
syntax on
imap jj <Esc>
imap yy <Esc>:w<cr>

"If plug is not installed, download and install plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" When you put a new plug in, do :PlugInstall
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
Plug 'Lokaltog/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
let g:rainbow_active=1
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-pydocstring'
Plug 'romainl/vim-dichromatic'
Plug 'rakr/vim-one'
Plug 'ron-rs/ron.vim'
call plug#end()

"Show hidden files in NerdTree
let NERDTreeShowHidden=1
nmap ' :NERDTreeToggle<CR>
"
"Buffer Search for Ctrl-P
nmap ; :CtrlPBuffer<cr>

let mapleader = ","
nmap <leader>d :bd<cr>
nmap <leader>w :w<cr>
noremap <leader>i ^
noremap <leader>a $

"Copy and paste (neovim)
vnoremap  <leader>y  "+y
vnoremap  <leader>p  "+p

map <space> viw

nmap <silent> L <C-w>l
nmap <silent> H <C-w>h
nmap <silent> J <C-w>j
map <silent> K <C-w>k

"Open split vertical pannel + horizontal
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>S

" Behavior Changes
set laststatus=2
set title
set ruler

" Search Rules
set gdefault
" toggle to turn highlighting on and off
map <leader>/ :set hlsearch!<cr>

" Tabs to Spaces -
" To Set differnt tab/space behavior append 'autocmd FileType <python/haskell>'
"set tabstop=4 shiftwidth=4 expandtab
autocmd FileType *.rs set tabstop=4 shiftwidth=4 expandtab

" https://github.com/neoclide/coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gj <Plug>(coc-diagnostic-next)
nmap <silent> gk <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Color Scheme - https://github.com/romainl/vim-dichromatic
colorscheme dichromatic

let g:rustfmt_autosave = 1

" Remove trailing white spaces in python files.
autocmd BufWritePre *.py %s/\s\+$//e
