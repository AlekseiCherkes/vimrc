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

"
" Command line completion
"

set wildmenu
set wildmode=longest,longest:full,full

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
:nnoremap <leader>d "_d

" It adds motions like 25j and 30k to the jump list, so you can cycle
" through them with control-o and control-i.
" source: https://www.vi-improved.org/vim-tips/
if !has('ide') " Skip if in IdeaVim
    nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
    nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
endif

