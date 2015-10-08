set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'bling/vim-airline'
Plugin 'powerline/fonts'
Plugin 'airblade/vim-gitgutter'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'xero/sourcerer.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
call vundle#end()

" Colors
colorscheme hybrid_reverse 

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
"tabs=true
filetype plugin indent on

set guioptions-=r
set guioptions-=L

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#whitespace#checks = []  

" VCS
let g:gitgutter_realtime = 1

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" jj does esc
imap jj <Esc>

" Disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Alt nagivates windows
if has('gui_running')
		nnoremap ˙ <C-w>h
		nnoremap ∆ <C-w>j
		nnoremap ˚ <C-w>k
		nnoremap ¬ <C-w>l
endif

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
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" K to search for current word
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint', 'jshint']

