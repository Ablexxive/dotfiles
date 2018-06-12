set number
set background=dark
syntax on
imap jj <Esc>

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
Plug 'editorconfig/editorconfig'
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'
let g:rainbow_active=1
Plug 'w0rp/ale'
call plug#end()


"Show hidden files in NerdTree
let NERDTreeShowHidden=1

nmap ' :NERDTreeToggle<CR>
nmap " :ALEToggle<CR>
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

nmap <silent> L <C-w>l
nmap <silent> H <C-w>h
nmap <silent> J <C-w>j
nmap <silent> K <C-w>k

"Open split vertical pannel + horizontal
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>S

" Behavior Changes
set laststatus=2
set title
set ruler

" Search Rules
set gdefault

" Sets gray color for line limits - py
set colorcolumn=121
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Tabs to Spaces -
" To Set differnt tab/space behavior append 'autocmd FileType <python/haskell>'
set tabstop=4 shiftwidth=4 expandtab

" ALE
let g:ale_linters = {'python':['pylint']}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <space>k <Plug>(ale_previous_wrap)
nmap <silent> <space>j <Plug>(ale_next_wrap)
" This will not run linter when you open a file. To run it, simply save the
" file.
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
"let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
"let g:ale_keep_list_window_open = 1
"let g:airline#extensions#ale#enabled = 1
