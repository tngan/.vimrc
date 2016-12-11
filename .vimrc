set nocompatible              " be iMproved, required

set runtimepath^=~/.vim/bundle/ctrlp.vim
set mouse=                    " use mouse to copy

""""""""""""""""""""""""
" plug definition
""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ctrlp
Plug 'tacahiroy/ctrlp-funky'

" scheme
Plug 'morhetz/gruvbox'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" silver searcher
Plug 'mileszs/ack.vim'

" git
Plug 'airblade/vim-gitgutter'

" theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" langs
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'jelera/vim-javascript-syntax'
Plug 'sheerun/vim-polyglot'

" others
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'neomake/neomake'


""""""""""""""""""""""""
" setting
""""""""""""""""""""""""

call plug#end()

syntax enable
set cursorline
set tabstop=2       
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set noshowmode 
set number
set numberwidth=4

colorscheme gruvbox

" syntax
"
" - from typescript-vim
let g:neomake_typescript_enabled_makers = ['tsc']

" ctrl p
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" nerdtree
"
"""""" close only remain nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable deoplete
let g:deoplete#enable_at_startup = 1

" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'ravenpower'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set background=dark

" ag
let g:ctrlp_working_path_mode = 'ra'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""
" key map
""""""""""""""""""""""""
let mapleader = "\<Space>"

" plugin shortcut
nnoremap <Leader>i :PlugInstall<Cr>
nnoremap <Leader>n :NERDTreeToggle<Cr>
nnoremap <Leader>p :CtrlP<Cr>
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>w :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" basic control: shift buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-d> :bdelete<CR>
nnoremap <S-w> :w\|bdelete<CR>


""""""""""""""""""""""""
" tricks - reload vimrc on save
""""""""""""""""""""""""
if has("autocmd")

  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au! BufWritePost,FileWritePost * Neomake

endif

nnoremap <Leader>r :w<CR>\| :so %<CR>

"""""""""""""""""""""""
" pyenv configuration
"""""""""""""""""""""""
"
"let g:python_version = `python -c 'import sys; print(".".join(map(str, sys.version_info[:1])))'`
"if g:python_version =~3
"  let g:python2_host_prog = `which python`
"else
"  let g:python3_host_prog = `which python3`
"endif

""""""""""""""""""""""""
" debugging
""""""""""""""""""""""""
" let g:ctrlp_show_hidden = :echo has("python3")
