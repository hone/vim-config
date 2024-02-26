set nocompatible
filetype plugin indent on
syntax enable

set smartindent
set nu
set shell=/bin/bash

" Colors
" check $STY to ensure we aren't in screen,
" since it doesn't support truecolors
if (has("termguicolors")) && (empty($STY) || $STY=="")
	let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
	let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
	set termguicolors
	set term=xterm-256color
else
	set t_Co=256
endif
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Global Swap Files
set directory^=$HOME/.vim/swap//

autocmd FileType ruby,dart,javascript,json,html.handlebars,typescript setlocal shiftwidth=2 tabstop=2 expandtab

" RustFmt
let g:rustfmt_autosave = 1

" DartFmt
let g:ale_dart_dartfmt_executable = '$HOME/flutter/bin/cache/dart-sdk/bin/dartfmt'

" Ale
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
			\   'javascript': ['eslint'],
			\   'rust': ['analyzer'],
			\   'go': ['gopls']
			\}
let g:ale_fixers = {
			\   'css': ['prettier'],
			\   'javascript': ['prettier'],
			\   'typescript': ['prettier'],
			\   'rust': ['rustfmt'],
			\}
let g:ale_rust_rls_config = {
      \ 'rust': {
      \     'clippy_preference': 'on'
      \   }
      \ }

" Go
let g:go_version_warning = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" :h ale-completion-completeopt-bug
set completeopt+=noinsert

" TagBar
nmap <F10> :TagbarToggle<CR>

" Load all docs
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
