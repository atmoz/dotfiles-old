set nocompatible

execute pathogen#infect()
execute pathogen#helptags()

set encoding=utf-8
set sessionoptions=curdir,folds,tabpages,winsize

" ============================================================================
" backup, undo and dirs
" ============================================================================
set history=1000
set undolevels=1000
set backup
set backupdir=~/.vimbackup//
set directory=~/.vimswap//
set undodir=~/.vim/.undo//
set undofile

silent execute '!mkdir -p ~/.vimbackup'
silent execute '!mkdir -p ~/.vimswap'

" ============================================================================
" behavior
" ============================================================================
set nostartofline
set wrap
set textwidth=79
set scrolloff=5
set backspace=indent,eol,start

set nosmartindent
set autoindent
set copyindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
autocmd FileType go setlocal noexpandtab nosr sts=0 shiftwidth=4 tabstop=4

set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*/public_html/assets/*,*/www/assets/*,*/old/*

set wrapscan
set ignorecase
set smartcase
set incsearch

set splitbelow
set splitright

set foldmethod=indent
set foldlevelstart=99

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Mark similar words
"nmap <F12> :exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))<CR>

" Mark variables and function calls
"autocmd CursorMoved * exe printf('match IncSearch /\V\($\|->\|::\)\<%s\>/', escape(expand('<cword>'), '/\'))

" ============================================================================
" keymapping
" ============================================================================
let mapleader="\<Space>"
map <leader>n :NERDTreeToggle<CR>
map <leader>t :TlistToggle<CR>
map <leader>w :w<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>

let g:user_zen_leader_key = '<leader>z'

" Mark similar words
nmap <F12> :exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))<CR>

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Do not skip wrapped lines
nmap j gj
nmap k gk

nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" ============================================================================
" looks
" ============================================================================
filetype plugin indent on
syntax enable
"let g:solarized_visibility="low"
"let g:solarized_termtrans="1"
let base16colorspace=256
let g:base16_hide_special=1
set background=light
colorscheme base16-default

set linespace=0
set lazyredraw
set ttyfast
set hidden

set laststatus=2
set ruler
set nocursorcolumn
set cursorline
set numberwidth=4

" consistent background for git-gutter
highlight clear SignColumn

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:⋅,eol:¬
"autocmd InsertEnter * set list
"autocmd InsertLeave * set nolist

" Highlight trailing whitespace
highlight link ExtraWhitespace CursorLine
autocmd ColorScheme * highlight link ExtraWhitespace CursorLine
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Run :FixWhitespace to remove end of line white space
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" Use markdown syntax on *.md files
au BufRead,BufNewFile *.md set filetype=markdown

" ============================================================================
" airline
" ============================================================================

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#trailing_format = 't[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i[%s]'

" Fix glitch at startup
"autocmd VimEnter * AirlineRefresh

" ============================================================================
" git-gutter
" ============================================================================
let g:gitgutter_realtime = 1000
let g:gitgutter_eager = 0
"autocmd ColorScheme * highlight clear SignColumn
"autocmd ColorScheme * highlight link SignColumn NONE
"autocmd ColorScheme * highlight link SignColumn LineNr

" ============================================================================
" Tlist
" ============================================================================
let tlist_php_settings = 'php;c:class;f:function;d:constant'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 40
let Tlist_Close_On_Select = 1

" ============================================================================
" ctrlp
" ============================================================================
let g:ctrlp_max_height = 20
let g:ctrlp_regexp = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
    \ 'PrtCurLeft()': ['<left>', '<c-^>'],
    \ }

" ============================================================================
" Other plugins
" ============================================================================

let g:NERDTreeQuitOnOpen = 1

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" auto open/close error window
let g:syntastic_auto_loc_list = 1

let g:vdebug_options = {
    \ 'break_on_open': 0
    \ }

" Use Ag instead of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use markdown syntax on *.md files
au BufRead,BufNewFile *.md set filetype=markdown
