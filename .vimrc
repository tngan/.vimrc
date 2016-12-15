" set nocompatible              " be iMproved, required

" set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=/usr/local/opt/fzf
set mouse=                    " use mouse to copy
set completeopt-=preview      " remove preview window

""""""""""""""""""""""""
" plug definition
""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ctrlp
" Plug 'tacahiroy/ctrlp-funky'

" scheme
Plug 'morhetz/gruvbox'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" searcher
Plug 'mileszs/ack.vim'

" git
Plug 'airblade/vim-gitgutter'

" theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" langs
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sheerun/vim-polyglot'
" Plug 'mhartington/deoplete-typescript'

" others
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'neomake/neomake'
Plug 'KabbAmine/vCoolor.vim'

""""""""""""""""""""""""
" setting
""""""""""""""""""""""""

" enable deoplete
let g:deoplete#enable_at_startup = 1

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

" html auto close tag
" =====
let g:closetag_filenames = "*.jsx,*.html,*.phtml"

" nerdtree
"
"""""" close only remain nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

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

" neomake
"
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_typescript_tsc_maker = {
    \ 'args': ['--project', 'tsconfig.json'] }

nmap <Leader>o :lopen<CR>

""""""""""""""""""""""""
" key map
""""""""""""""""""""""""
let mapleader = "\<Space>"

" plugin shortcut
nmap <Leader>pi :PlugInstall<Cr>
nmap <Leader>pc :PlugClean<Cr>
nmap <Leader>pu :PlugUpdate<Cr>

nmap <Leader>n :NERDTreeToggle<Cr>
"nmap <Leader>p :CtrlP<Cr>
"nmap <Leader>f :CtrlPFunky<Cr>
nmap <Leader>p :FZF<Cr>
" narrow the list down with a word under cursor
nmap <Leader>w :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" basic control: shift buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <S-d> :bdelete<CR>
nmap <S-w> :w\|bdelete<CR>

" color picker
nmap <Leader>c :VCoolor<CR>

""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '1'  " This do disable full signature type on autocomplete

""""""""""""""""""""""""
" tricks - reload vimrc on save
""""""""""""""""""""""""
if has("autocmd")

  " cursor back to the location when quit
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au GUIEnter * set visualbell t_vb=
  autocmd! BufWritePost,BufEnter * Neomake

endif

"""""""""""""""""""""""
" neomake configuration

nmap <Leader>r :w<CR>\| :so %<CR>

"""""""""""""""""""""
" disable beep
""
set noerrorbells visualbell t_vb=

""""""""""""""""""""""""
" debugging
""""""""""""""""""""""""
" let g:ctrlp_show_hidden = :echo has("python3")
" let g:neomake_verbose=3
