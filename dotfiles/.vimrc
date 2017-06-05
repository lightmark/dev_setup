set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ======== Plugins =========
" Airline bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
" A web-developer’s toolkit that can greatly improve your HTML & CSS workflow
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'

" color
set background=dark
Plugin 'morhetz/gruvbox'

call vundle#end()            " required
filetype plugin indent on    " required

" cutomized setttings
colorscheme gruvbox
set number
set laststatus=2
set pastetoggle=<F2>
set ignorecase
set smartcase
set cursorline
map <C-n> :NERDTreeToggle<CR>
set incsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

let g:indent_guides_guide_size = 1
