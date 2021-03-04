let g:vim_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
exec "source " . g:vim_dir . 'keys'
exec "source " . g:vim_dir . 'plugins'
"exec "source " . g:vim_dir . 'customfunctions'

" Main settings {{{
set history=100
set nocompatible
set mouse=a           "use mouse everywhere
set number
set showcmd
set incsearch
set hlsearch
set foldmethod=marker "folds between {{{ and }}}

"Folding bg color change
hi Folded ctermbg=234

"rechecking whole file for syntax
autocmd BufEnter * :syntax sync fromstart
autocmd BufWritePost * :syntax sync fromstart

" Remove spaces from line ends
autocmd BufWritePre * :%s/\s\+$//e

syntax on
filetype on
filetype plugin on
filetype indent on
" }}}

"global <TAB> and indentation config {{{
set tabstop=2
set softtabstop=2     "tab between words
set shiftwidth=2      "tab width
set smarttab

set cindent           "enable C program indenting
set smartindent        "enable smartindent
set autoindent
set expandtab

set cinkeys=0{,0},:,0#,!^F

"TODO indentexpr per filetype
"}}}

" Reselect visual block after reindent {{{
vnoremap < <gv
vnoremap > >gv
" }}}

" vim-airline {{{
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='ubaryd'
" }}}

" Window splitting {{{
set splitbelow
set splitright
" }}}

" Emmet {{{
let g:user_emmet_leader_key = "<c-z>"
" }}}

" vim: ft=vim foldmethod=marker
