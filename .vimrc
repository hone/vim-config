set nocompatible
filetype plugin indent on
syntax enable

set smartindent
set nu

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
let ayucolor="dark"
colorscheme ayu

autocmd FileType ruby,dart,javascript,json,html.handlebars setlocal shiftwidth=2 tabstop=2 expandtab

" RustFmt
let g:rustfmt_autosave = 1

" DartFmt
let g:ale_dart_dartfmt_executable = '$HOME/flutter/bin/cache/dart-sdk/bin/dartfmt'

" Ale
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['rls']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_rls_toolchain = 'stable'

" TagBar
nmap <F10> :TagbarToggle<CR>

" Load all docs
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
