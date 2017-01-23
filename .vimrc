set nocompatible              " be iMproved, required
set hidden
set splitbelow
set splitright
set termguicolors
set title
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
"Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'xolox/vim-misc'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rking/ag.vim'
call vundle#end()

" Colors
colorscheme PaperColor

" Fonts
set guifont=Hack:h15
set encoding=utf8
set fillchars+=vert:│
autocmd ColorScheme * hi VertSplit ctermbg=NONE guibg=NONE

" General
syntax on
set smartcase
set wildmenu
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set mouse=a
set autoindent
set dir=~/tmp
set hlsearch
set cursorline 
"tabs=true
set guioptions+=c
filetype plugin indent on

set guioptions-=r
set guioptions-=L

" Airline
"let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline#extensions#whitespace#checks = []  


" VCS
let g:gitgutter_realtime = 1

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'


" W = w
command! WQ wq
command! Wq wq
command! W w
command! Q q

" jk does esc
imap jk <Esc>

" move vertically by visual line
"nnoremap j gj
"nnoremap k gk

" Disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Alt nagivates windows
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" Eazy copy
vnoremap <C-c> "*y

" nvim only
if has('nvim')
		autocmd vimenter * NERDTree
		tnoremap <A-h> <C-\><C-n><C-w>h
		tnoremap <A-j> <C-\><C-n><C-w>j
		tnoremap <A-k> <C-\><C-n><C-w>k
		tnoremap <A-l> <C-\><C-n><C-w>l
		nnoremap <A-h> <C-w>h
		nnoremap <A-j> <C-w>j
		nnoremap <A-k> <C-w>k
		nnoremap <A-l> <C-w>l
endif

" Auto Reload .vimrc on change
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.vimrc source $MYVIMRC
augroup END " }

" silver searcher
"let g:ag_working_path_mode="r"

" K to search for current word
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap \ :Ag<SPACE>

" Trim whitespace on save
autocmd FileType js,json,rb autocmd BufWritePre <buffer> :%s/\s\+$//e

" custom leader
let mapleader=","
set timeout timeoutlen=1500

" ,cc comment toggler
nmap <leader>cc <plug>NERDCommenterToggle
vmap <leader>cc <plug>NERDCommenterToggle

" Eazy nerdtree
map <leader>n <plug>NERDTreeTabsToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
vmap <leader>nf :NERDTreeFind<CR>
"let g:NERDTreeMapOpenInTab='<CR>'

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Easy motion stuff
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Replace default search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" syntastic
set statusline+=%#warningmsg#
set statusline+=%*

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" show whitespace chars with ':set list', disable with ':set invlist'
set listchars=eol:$,tab:--,trail:~,extends:>,precedes:<
 
"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>

