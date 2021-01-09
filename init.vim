" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" ===
" ===
let mapleader=" "
set nocompatible
" colorscheme hybrid
" let g:solarized_termcolors=256
" colorscheme solarized
colors deus
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on

" 拼写检查：spell
"
let &t_si = "\<esc>]50;cursorshape=1\x7"
let &t_sr = "\<esc>]50;cursorshape=2\x7"
let &t_ei = "\<esc>]50;cursorshape=0\x7"

" Basic
set number
set relativenumber
set cursorline
set wrap
set wildmenu
set showcmd
set scrolloff=5
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
set mouse=a


" ident
set expandtab
" set list
set tw=0
set backspace=indent,eol,start
set foldmethod=indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
 

" Search
""set hlsearch
set incsearch 
set ignorecase
set smartcase
" 忽略键功能
map s <nop>
map <space> <nop>

" 文件处理
map R :source $MYVIMRC<CR>
map <LEADER>S :w<CR>
map Q :q<CR>
map W :q!<CR>
map <LEADER><tab> gg<Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <C-\> <++><right>


map C :normal I" <CR>
map <LEADER>vim :tabe ~\AppData\Local\nvim\init.vim<CR>

" 分屏
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map F <LEADER><LEADER>s

" 标签页
map <C-t> :tabe<CR>
map <C-k> :-tabnext<CR>
map <C-j> :+tabnext<CR>

" 光标跳转
noremap L $
noremap H ^
noremap J 5j
noremap K 5k
noremap <LEADER><CR> :nohlsearch<CR>


" 括号补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>O
inoremap <C-l> ;


" 普通模式映射
nnoremap ( f(
nnoremap ) F(


" airline config
"
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 3
" let g:ycm_autoclose_preview_window_after_completion = 1


" NERDTree-git
"
map tt :NERDTreeToggle<CR>
map tf :NERDTreeFind<CR>
let NERDTreeWinPos="right"


" vim-table-mode
"
map <LEADER>tm :TableModeToggle<CR>


" ===
" === tcomment_vim
" ===
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>n g>c
vmap <LEADER>n g>
nmap <LEADER>vv g<c
vmap <LEADER>vv g<


" Markdown-Preview
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


" Compile function
noremap <LEADER>R :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :res 15
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device
        CocCommand flutter.dev.openDevLog
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs
"

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
    Plug 'easymotion/vim-easymotion'
    Plug 'mhinz/vim-startify'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround/'
    Plug 'w0ng/vim-hybrid'
    Plug 'itchyny/vim-cursorword'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'dhruvasagar/vim-table-mode'
	Plug 'tomtom/tcomment_vim'
    Plug 'theniceboy/antovim'
    Plug 'godlygeek/tabular' 
    Plug 'mattn/emmet-vim'
    Plug 'theniceboy/vim-deus'
    Plug 'gcmt/wildfire.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'relese'}
call plug#end()

