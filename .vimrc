"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format

" indent foramt
set autoindent
set smartindent
set cindent
" table format
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab 		" do not use space replace tab
"set nowrap 			" do not auto-fill

" file formats
set fileformats=unix,dos
set fileformat=mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set editing enviroment
"
"let &termencoding=&encoding
"set fileencodings=utf-8,gbk,ucs-bom,cp936
"set fileencoding=gb18030
"set fileencodings=utf-8,gb18030,utf-16,big5
set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set fileencoding=gb2312

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and match
"
set showmatch 			" highlight match brackets
set matchtime=5 		" match time
set scrolloff=10  		" keep 10 line from button
set hlsearch 			" highlight search
set nowrapscan 		        " search file golbally
set incsearch 			" searching while input
set ignorecase 			" ingored case when search

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File setting
"
set shortmess=atI 		" disable startup message
set report=0 			" show changes in command windows
set fillchars=vert:\ ,stl:\ 	" show space in split
set mouse=a 			" enable mouse everywhere
set selection=exclusive
set selectmode=mouse,key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal

let mapleader = "-"             " prefix key map
set viminfo+=! 			" save the golbal arguments
set history=300 		" history numbers
set nocompatible 		" use vim not vi
set foldmethod=syntax
set foldlevel=100    		" do not fold when startup
set nu
set spell                       " enable spell check
set fileencodings=utf-8,gbk
set ruler
set nobackup 			" do not backup files
"set backup
syntax enable
syntax on 			" highlight syntax
set magic 			" set reguar expressions
set backspace=indent,eol,start 	" tell where to delete
set showcmd                     " show command line
set noerrorbells 		" disable errors bells
set novisualbell                          " disable visual cursor
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  " modified config file
nnoremap <leader>sv :source $MYVIMRC<cr>  " config source file
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname)):w  " modified file name

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"
if has("gui_running")
au GUIEnter * simalt ~x            " auto maximize
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b
endif
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

let hasVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let hasVundle=0
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'yuttie/hydrangea-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jreybert/vimagit'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/undotree'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'

if hasVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-airline
let g:airline#extensions#tabline#enabled = 1  " enable tabline
nmap <leader><C-n> :bnext<CR>
nmap <leader><C-p> :bprev<CR>
"syntasticexpand
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = 'E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'
"tagbarexpand
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#tagbar#flags = 'p'
"vimagit
let g:airline#extensions#vimagit#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hydrangea
"
colorscheme hydrangea                        " colorscheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree
"
autocmd vimenter * NERDTree
map <leader>sn :NERDTreeToggle<CR>           " nerdtree key map
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=20
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.DAT']
let NERDTreeShowBookmarks=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimagit
"
map <leader>sm :Magit<CR>                   " enable magit

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tagbar
"
nmap  <leader>st :TagbarToggle<CR>

if has('unix')
  let g:tagbar_ctags_bin = '/usr/bin/ctags'
elseif has('mac')
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
elseif has('win32')
  let g:tagbar_ctags_bin = 'C:\Program Files\ctags58\ctags.exe'
endif

let g:tagbar_show_linenumbers = 1
let g:tagbar_width = 20
autocmd vimenter * Tagbar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntastic
"
map <leader>ssc :SyntasticCheck<CR>
map <leader>ssi :SyntastiInfo<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}C!r!>set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_debug = 1
let g:syntastic_debug_file = "~/syntastic.log"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdcommenter
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"undotree
"
nnoremap <leader>su :UndotreeToggle<cr>
if has("persistent_undo")
        set undodir='~/.undodir/'
        set undofile
    endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"javacomplete2
"
autocmd FileType java setlocal omnifunc=javacomplete#Complete
map <F5> :call CompileRunGcc()<CR>
imap <F5> <ESC>:call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "cd %:p:h"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto-pairs
"
let g:AutoPairsFlyMode = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-surround
"
let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"emmet
"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <F3> <Esc><C-Y>,i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
