"
" begin Shaun's vimrc
"

" General {{{
set nocompatible
set clipboard=unnamedplus
let mapleader = ","
let maplocalleader = ","

" Enable 24-bit color
if !has('gui')
	let &t_8f = "[38;2;%lu;%lu;%lum"
	let &t_8b = "[48;2;%lu;%lu;%lum"

	let &t_ut = ''
	set termguicolors
endif

set dictionary+=/usr/share/dict/words
set laststatus=2
set noshowmode
set number relativenumber " Show line numbers
set cursorline " Highlight current line
set splitbelow splitright

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
Plug 'morhetz/gruvbox'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'

call plug#end()
"}}}
" Plugin Settings {{{


" CtrlP
let g:ctrlp_working_path_mode = 'ca'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTreeToggle' argv()[0] | endif

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1

"}}}
" Interface Setup (Themes, colors, etc) {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" let g:airline_skip_empty_sections = 1

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_number_column='bg1'
colorscheme gruvbox
"}}}
" Keymappings (Remappings... =) ) {{{

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
nnoremap : ;

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

" vim:fdm=marker
