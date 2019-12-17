"
" begin Shaun's vimrc
"

" General {{{
set nocompatible
set clipboard=unnamedplus
let mapleader = ","
let maplocalleader = ","

" Enable 24-bit color
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set dictionary+=/usr/share/dict/words
set shortmess+=I
set laststatus=2
set hidden
set noshowmode
set number relativenumber " Show line numbers
set cursorline " Highlight current line
set splitbelow splitright
syntax on

"}}}
" Plugins {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'dylanaraps/wal.vim'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"}}}
" Plugin Settings {{{

" CtrlP
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_cmd = 'CtrlPMRU'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTreeToggle' argv()[0] | endif

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1

"}}}
" Interface Settings {{{

" Airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 0

" Gruvbox
" set background=dark
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_number_column = 'bg1'
" let g:gruvbox_italic = 1
" colorscheme gruvbox

" One Dark
colorscheme onedark

"}}}
" Keymappings {{{

" Disable arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Sane line scrolling (ignore line wrap)
nmap j gj
nmap k gk

" Swap semi-colon and colon
nnoremap ; :

" Clear search matches
noremap <silent><Leader><Space> :noh<cr>:call clearmatches()<cr>

"" Utility mappings

nnoremap <leader>sop :source %<cr>

" Plug

nnoremap <Leader>pi :PlugInstall<cr>
nnoremap <Leader>pu :PlugUpdate<cr>
nnoremap <Leader>pc :PlugClean<cr>

" NERDTree

nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>nl :NERDTreeFind<cr>

"}}}
" Sources {{{

" CoC
source /home/shaun/.config/nvim/cocrc.vim

" vim:fdm=marker
