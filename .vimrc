set nocompatible

call pathogen#infect()
call pathogen#helptags()

set encoding=utf-8
filetype plugin indent on
let g:solarized_visibility="low"
syntax enable
set background=dark
colorscheme solarized

set history=1000
set undolevels=1000
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize

set linespace=0
set lazyredraw
set ttyfast
set hidden

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:⋅,eol:¬

set nostartofline
set wrap
set textwidth=79
set colorcolumn=80
set scrolloff=5
set backspace=indent,eol,start

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set wildmenu
set wildmode=list:longest
set wildignore=*.swp

set laststatus=2
set ruler

set nocursorcolumn
set cursorline
set number
set numberwidth=4
set relativenumber

let mapleader=","
map <leader>n :NERDTreeToggle<CR>
map <leader>t :TlistToggle<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

let g:user_zen_leader_key = '<leader>z'

let tlist_php_settings = 'php;c:class;f:function;d:constant'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 40
let Tlist_Close_On_Select = 1

let g:ctrlp_regexp = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_lazy_update = 150
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
    \ 'PrtCurLeft()': ['<left>', '<c-^>'],
    \ }
