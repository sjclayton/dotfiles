"
" begin Shaun's vimrc
"

""" General {{{
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
set number relativenumber " Show line numbers
set cursorline " Highlight current line
set splitbelow splitright
"}}}
""" Plugins {{{
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
Plug 'rafaqz/ranger.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()
"}}}
""" Plugin Settings {{{

let g:ctrlp_working_path_mode = 'ca'

"}}}
""" Interface Setup (Themes, colors, etc) {{{

let g:airline_powerline_fonts = 1
" let g:airline_theme = 'aurora'
let g:airline_skip_empty_sections = 1

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox
"}}}
""" Keymappings (Remappings... =) ) {{{

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

" ranger.vim

nnoremap <Leader>rr :RangerEdit<cr>
nnoremap <Leader>rv :RangerVSplit<cr>
nnoremap <Leader>rs :RangerSplit<cr>
nnoremap <Leader>rt :RangerTab<cr>
nnoremap <Leader>ri :RangerInsert<cr>
nnoremap <Leader>ra :RangerAppend<cr>
nnoremap <Leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
"}}}

" vim:fdm=marker
