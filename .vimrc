set nocompatible
filetype plugin indent on
syntax enable

set smartindent
set nu

" Colors
set t_co=256

" RustFmt
let g:rustfmt_autosave = 1

" Ale
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['cargo']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_rust_cargo_use_clippy = 1

" TagBar
nmap <F10> :TagbarToggle<CR>

" Load all docs
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
