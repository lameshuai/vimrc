# vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"
set autoindent 			" 继承前一行的缩进方式，特别适用于多行注释
set smartindent 		" 为C程序提供自动缩进
set cindent 			" 使用C样式的缩进
set smarttab 			" 在行和段开始处使用制表符
set tabstop=4 			" 制表符为4
set softtabstop=4 		" 统一缩进为4
set shiftwidth=4
"set noexpandtab 		" 不要用空格代替制表符
"set nowrap 			" 不要换行
set fileformats=unix,dos 	" 自动识别UNIX格式和MS-DOS格式
set fileformat=mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置字符集(看情况具体选择)
"
"let &termencoding=&encoding
"set fileencodings=utf-8,gbk,ucs-bom,cp936
"set fileencoding=gb18030
"set fileencodings=utf-8,gb18030,utf-16,big5
"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencoding=gb2312

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配 
"
set showmatch 			" 高亮显示匹配的括号
set matchtime=5 		" 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=10  		" 光标移动到buffer的顶部和底部时保持10行距离
set hlsearch 			" 高亮搜索
set nowrapscan 		" 查找到文件头或文件尾时停止
set incsearch 			" 边输入边查找
set ignorecase 			" 在搜索的时候忽略大小写
				" 我的状态行显示的内容（包括文件类型和解码）

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"
set shortmess=atI 		" 启动的时候不显示那个援助索马里儿童的提示`
set report=0 			" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ 	" 在被分割的窗口间显示空白，便于阅读 ,stlnc:\(加了这个wm分割兰有\\\\\\\\\\\\\)
set mouse=a 			" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设置
"
let mapleader = "-"     " 前缀变量
set viminfo+=! 			" 保存全局变量
set history=300 		" history文件中需要记录的行数
set nocompatible 		" 不要使用vi的键盘模式，而是vim自己的
set foldmethod=syntax
set foldlevel=100    		" 启动vim时不要自动折叠代码
set nu
set spell                       " 启用拼写检查
set fileencodings=utf-8,gbk
set ruler                       
set showmatch 			" 高亮显示匹配的括号 
set nobackup 			" 不要备份文件（根据自己需要取舍） 
"set backup
syntax enable
syntax on 			" 语法高亮 
set magic 			" 设置正表达式
set backspace=indent,eol,start 	" 这指明在插入模式下在哪里允许 <BS> 删除光标前面的字符。
				" 逗号分隔的三个值分别指：行首的空白字符，换行符和插入模式开始处之前的字符。
set showcmd 			" 在 Vim 窗口右下角，标尺的右边显示未完成的命令
set noerrorbells 		" 不让vim发出讨厌的滴滴声
set novisualbell 		" 不要闪烁
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  " 修改配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>  " source配置文件
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname)):w  " 更改文件名

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"
if has("gui_running")
au GUIEnter * simalt ~x 
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
"插件
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'yuttie/hydrangea-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jreybert/vimagit'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-airline
"
let g:airline#extensions#tabline#enabled = 1  " 启用tabline
nmap <leader><C-n> :bnext<CR>                 " 前一个缓冲区
nmap <leader><C-p> :bprev<CR>                 " 后一个缓冲区

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hydrangea
"
colorscheme hydrangea                        " 颜色主题

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree
"
autocmd vimenter * NERDTree 
map <leader>sn :NERDTreeToggle<CR>           " 打开目录树映射
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=31
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.DAT']
let NERDTreeShowBookmarks=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
