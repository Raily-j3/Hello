" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Basic config
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


" ===
" === 
" ===
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

" indent
set expandtab
set tw=0
set backspace=indent,eol,start
set foldmethod=indent
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Search
" set hlsearch
set incsearch 
set ignorecase
set smartcase

" 忽略键功能
map s <nop>
map <space> <nop>


" 文件处理
map Q :q<CR>
map W :q!<CR>
map S :w<CR>
map <LEADER><LEADER>r :source $MYVIMRC<CR>
map <LEADER><tab> /<++><CR>:nohlsearch<CR>c4l
inoremap <C-\> <++><right>


map <LEADER><LEADER>vim :tabe ~/.config/nvim/init.vim<CR>

" 分屏
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
nnoremap <LEADER>s <LEADER><LEADER>s

" 标签页
map <C-t> :tabe<CR>
map <C-k> :-tabnext<CR>
map <C-j> :+tabnext<CR>

" 光标移动
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


" ==========================
" Plugs Config
" ==========================

" ===
" === airline
" ===
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 3
" let g:ycm_autoclose_preview_window_after_completion = 1


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
map tf :NERDTreeFind<CR>
let NERDTreeWinPos="right"


" ===
" === vim-tab-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === tcomment_vim
" ===
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>n g>c
vmap <LEADER>n g>
nmap <LEADER>v g<c
vmap <LEADER>v g<


" ===
" === Complie Function
" ===
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


" ===
" === MarkdownPreview
" ===
source ~/.vim/snippits.vim


" ===
" === coc.nvim
" ===

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
"
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs
"

call plug#begin('~/.vim/plugged')
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
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
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'dhruvasagar/vim-table-mode'
	Plug 'tomtom/tcomment_vim'
    Plug 'theniceboy/antovim'
    Plug 'godlygeek/tabular' 
    Plug 'mattn/emmet-vim'
    Plug 'theniceboy/vim-deus'
    Plug 'gcmt/wildfire.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'relese'}
    Plug 'jiangmiao/auto-pairs'
call plug#end()
