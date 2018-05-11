"===============================================================================
" Setting up Dein.vim - the vim plugin bundler
"===============================================================================

if &compatible          " required
  set nocompatible
endif

filetype off
" auto git clone Dein.vim
let s:plugin_path=expand('~/.vim/dein/')
let s:dein_path=expand('~/.vim/dein/repos/github.com/Shougo/dein.vim')
let s:dein_readme=expand(s:dein_path.'/README.md')

let s:initialization = 0
if !filereadable(s:dein_readme)
  echo "Installing Dein.vim ..."
  echo ""
  silent exec "!mkdir -p ".s:dein_path
  silent exec "!git clone https://github.com/Shougo/dein.vim.git ".s:dein_path
  let s:initialization=1
endif

" set the runtime path to include Dein
let &rtp.=','.s:dein_path

if dein#load_state(s:plugin_path)
  call dein#begin(s:plugin_path)
  " ======== Plugins =========
  call dein#add(s:dein_path)
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('ozelentok/denite-gtags')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('mattn/emmet-vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('morhetz/gruvbox')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on    " required
syntax enable

if dein#check_install()
  echo "Installing dein, please ignore key map error messages"
  echo ""
  call dein#install()
endif

"===============================================================================
" cutomized setttings
"===============================================================================
colorscheme gruvbox
set background=dark

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

let mapleader = ","
nnoremap <leader>ev :<C-u>vsplit $MYVIMRC<cr>
nnoremap <leader>sv :<C-u>source $MYVIMRC<cr>

set nocursorline " curlineline will cause vim slow with syntax on
set nocursorcolumn " ditto
set number
set laststatus=2
set pastetoggle=<F2>
set ignorecase
set smartcase
noremap <leader>t :NERDTreeToggle<CR>
set incsearch
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2 " make backspace work like most other apps

let g:indent_guides_guide_size = 1

"===============================================================================
" Denite
"===============================================================================
" use <C-j> and <C-k> to move up and down in denite insert mode
call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Denite file_rec<CR>
nnoremap <leader>f :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <leader>b :<C-u>Denite buffer<CR>

" gtags in vim using emacs key-binding
nnoremap <C-c>d :<C-u>DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
nnoremap <C-c>r :<C-u>DeniteCursorWord -buffer-name=gtags_ref  gtags_ref<cr>
nnoremap <C-c>g :<C-u>DeniteCursorWord -buffer-name=gtags_grep gtags_grep<cr>

"===============================================================================
" Customized shortcut setting
"===============================================================================
noremap <leader>s :update<CR>
"noremap <leader>k :confirm :bd<CR>
noremap <leader>k :b#<bar>bd#<CR>
"===============================================================================
" Facebook
"===============================================================================
"Clang format
" noremap <C-i> :pyf /usr/local/share/clang/clang-format.py<CR>
" inoremap <C-i> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i
