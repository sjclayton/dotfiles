""" General

set nocompatible
let mapleader = ","
let maplocalleader = ","

" Enable 24-bit color

if !has('gui')
	let &t_8f = "[38;2;%lu;%lu;%lum"
	let &t_8b = "[48;2;%lu;%lu;%lum"

	let &t_ut = ''
	set termguicolors
endif

set laststatus=2
set number relativenumber " Show line numbers
set cursorline " Highlight current line
set splitbelow splitright


""" Plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rafaqz/ranger.vim'

call plug#end()


""" Interface Setup (Themes, colors, etc)

let g:airline_powerline_fonts = 1
" let g:airline_theme = 'aurora'
let g:airline_skip_empty_sections = 1

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox


""" Keymappings (Remappings... =) )

" Swap colon and semicolon

nnoremap ; :
nnoremap : ;

" Utility mappings

nnoremap <Leader>pi :PlugInstall<cr>
nnoremap <Leader>pu :PlugUpdate<cr>
nnoremap <Leader>rr :RangerEdit<cr>
