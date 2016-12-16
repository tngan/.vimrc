set nocompatible

""""""""""""""""""""""""
" plug definition
""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'neomake/neomake'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'morhetz/gruvbox'

" git
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'

" theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" langs
Plug 'carlitux/deoplete-ternjs'
Plug 'mhartington/deoplete-typescript'

" others
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'neomake/neomake'
Plug 'KabbAmine/vCoolor.vim'

call plug#end()

syntax enable

set rtp+=/usr/local/opt/fzf
set cursorline
set tabstop=2       
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set noshowmode 
set number
set numberwidth=4
set mouse=                    " use mouse to copy
set background=dark
set completeopt-=preview      " remove preview window

" set noerrorbells visualbell t_vb= " disable beep sound

" set guifont=Source\ Code\ Pro\ Light:h13

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" syntax
"
" html auto close tag
let g:closetag_filenames = "*.jsx,*.html,*.phtml"

" deoplete
""""""""""""""""""""""""
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '1'  " This do disable full signature type on autocomplete

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

" neomake
"
autocmd! BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
let g:neomake_typescript_enabled_makers = ['tsc']

let g:neomake_highlight_lines = 1
let g:neomake_open_list = 2
let g:neomake_list_height = 6
let g:neomake_logfile='/tmp/neomake.log'

" deoplete
" =============
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '1'  " This do disable full signature type on autocomplete
let g:tern#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx'
    \ ]


""""""""""""""""""""""""
" key map
""""""""""""""""""""""""
let mapleader = "\<Space>"

" plugin shortcut
nmap <Leader>pi :w<CR> \| :so %<CR> \| :PlugInstall<Cr>
nmap <Leader>pc :w<CR> \| :so %<CR> \| :PlugClean<Cr>
nmap <Leader>pu :PlugUpdate<Cr>

nmap <Leader>n :NERDTreeToggle<Cr>

nmap <Leader>p :FZF<Cr>
nmap <Leader>pp :FZF ~/Desktop/workspace/<Cr>
nmap <Leader>pf :FZF ~/Desktop/fanswave/projects<Cr>

" basic control: shift buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <S-d> :bdelete<CR>
nmap <S-w> :w\|bdelete<CR>

" color picker
nmap <Leader>c :VCoolor<CR>
nmap <Leader>r :w<CR>\| :so %<CR>

nmap <Leader>g :noh<CR>
nmap <Leader>s :wq<CR>

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

""""""""""""""""""""""""
" au 
""""""""""""""""""""""""
if has("autocmd")

  " cursor back to the location when quit
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " au GUIEnter * set visualbell t_vb=
  au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close only remain nerdtree

endif

filetype plugin indent on
syntax on

""""""""""""""""""""""""
" debugging && tips
"
" c-v I <Something> Esc : Multiple line comment
"
""""""""""""""""""""""""
" let g:ctrlp_show_hidden = :echo has("python3")
" let g:neomake_verbose=3
"
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#auto_complete_start_length = 0
" let g:auto_complete_start_length = 0
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#enable_debug = 1
" let g:deoplete#enable_profile = 1
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
