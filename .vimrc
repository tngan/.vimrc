set nocompatible              " be iMproved, required
filetype off                  " required

" Plugin 'othree/yajs.vim'
" Plugin 'slashmili/alchemist.vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim

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
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mhartington/deoplete-typescript'
Plug 'jason0x43/vim-js-indent'
Plug 'leafgarland/typescript-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'

" others
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

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

" solarized.vim

" ignore wildcard
" checkout global agignore setting for ctrlp in ~/.agignore

" keymapping

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
let g:gruvbox_termcolors=16

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

" basic control: shift buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-d> :bdelete<CR>
nnoremap <S-w> :w\|bdelete<CR>


""""""""""""""""""""""""
" debugging
""""""""""""""""""""""""
" let g:ctrlp_show_hidden = :echo has("python3")
