set number
syntax enable
syntax on
set nocompatible
set autoindent
set showmatch
set spell
let mapleader = "-"
if has("gui_running")
au GUIEnter * simalt ~x 
set guioptions-=m  
set guioptions-=T  
set guioptions-=L 
set guioptions-=r 
set guioptions-=b
endif


iab ld <leader>
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
	\set guioptions-=r <bar>
        \set guioptions-=l <bar>
        \set guioptions-=b <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
	\set guioptions+=r <bar>
        \set guioptions+=l <bar>
        \set guioptions+=b <bar>
    \endif<CR>

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'yuttie/hydrangea-vim'
Plugin 'jreybert/vimagit'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

nmap <leader>q  :q!<CR>
nmap <leader><C-n> :bnext<CR>
nmap <leader><C-p> :bprev<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
colorscheme hydrangea
let g:airline#extensions#tabline#enabled = 1

autocmd vimenter * NERDTree
map <leader>sn :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=31
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.DAT']
let NERDTreeShowBookmarks=1


