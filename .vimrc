set nocompatible              " be iMproved, required
filetype off                  " required

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim

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
Plugin 'scrooloose/nerdcommenter'
call vundle#end()            " required


" Colors
colorscheme anderson

" Fonts
set guifont=Hack:h15

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
filetype plugin indent on

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

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
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Trim whitespace
autocmd FileType js,json,rb autocmd BufWritePre <buffer> :%s/\s\+$//e
 
