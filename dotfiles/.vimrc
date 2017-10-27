set nocompatible              " be iMproved, required
filetype off                  " required

"===============================================================================
" Setting up Vundle - the vim plugin bundler
"===============================================================================
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ======== Plugins =========
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'Valloric/YouCompleteMe'

Plugin 'Shougo/unite.vim'
Plugin 'hewes/unite-gtags'
Plugin 'Shougo/vimproc.vim'

" color
set background=dark
Plugin 'morhetz/gruvbox'

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
filetype plugin indent on    " required

"===============================================================================
" cutomized setttings
"===============================================================================
let mapleader = ","
nnoremap <leader>ev :<C-u>vsplit $MYVIMRC<cr>
nnoremap <leader>sv :<C-u>source $MYVIMRC<cr>
colorscheme gruvbox
syntax on
set number
set laststatus=2
set pastetoggle=<F2>
set ignorecase
set smartcase
set cursorline
noremap <leader>t :NERDTreeToggle<CR>
set incsearch
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2 " make backspace work like most other apps

let g:indent_guides_guide_size = 1

"===============================================================================
" Unite
"===============================================================================
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>:execute 'Unite -direction=dynamicbottom -buffer-name=Files -start-insert file_rec/async:'.unite#util#path2project_directory(expand("%:p"))<CR>
nnoremap <leader>f :<C-u>Unite -direction=dynamicbottom -buffer-name=Files -start-insert file<CR>
nnoremap <leader>m :<C-u>Unite -direction=dynamicbottom -buffer-name=MRU   -start-insert file_mru<CR>
nnoremap <leader>b :<C-u>Unite -direction=dynamicbottom -buffer-name=buffer -start-insert buffer<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
endfunction


function! GetProjectPath()
  return unite#util#path2project_directory(expand("%:p")) 
endfunction

nnoremap <leader><C-]> :let $GTAGSROOT=GetProjectPath() <bar> :<C-u>:execute 'Unite -direction=dynamicbottom gtags/def:'.expand('<cword>')<CR>
nnoremap <leader><C-[> :let $GTAGSROOT=GetProjectPath() <bar> :<C-u>:execute 'Unite -direction=dynamicbottom gtags/ref:'.expand('<cword>')<CR>

" Use ack
" http://beyondgrep.com/
if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts =
  \ '-i --no-heading --no-color -k -H'
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
  \ '-i --no-heading --no-color -k -H'
endif

nnoremap <leader>g :<C-u>:execute 'Unite -direction=dynamicbottom -no-quit -keep-focus grep:'.g:get_project_path().'::'.expand('<cword>')<CR>

"===============================================================================
" Customized shortcut setting
"===============================================================================
noremap <leader>s :update<CR>
noremap <leader>k :confirm :bd<CR>

"===============================================================================
" Facebook
"===============================================================================
"Clang format
noremap <C-i> :pyf /usr/local/share/clang/clang-format.py<CR>
inoremap <C-i> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i
