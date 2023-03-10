""
"" Common settings for Vim/Neovim/IdeaVim
""

set nocompatible

set number
set relativenumber

set cursorline

set autowriteall

set mouse=a

set encoding=utf-8

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent

set nowrap

set hlsearch
set incsearch
set ignorecase
set smartcase

set termguicolors

set scrolloff=1
set sidescrolloff=1

set updatetime=1000

set colorcolumn=120

"
" Clipboard
"

set clipboard=unnamedplus

"
" Russian
"

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"
" Mappings
"

let mapleader = " "

" cursor always in the center
:nnoremap <C-d> <C-d>zz
:nnoremap <C-u> <C-u>zz
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" join lines without moving the curson
:nnoremap J mzJ`z

" hide search results
:nnoremap <leader>h :noh<CR>

