call plug#begin(stdpath('data') . '/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdTree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

call plug#end()

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': ['pyls'],
        \ 'whitelist': ['python'],
        \ })
endif

" terminal mode
if has("nvim")
	tnoremap <esc> <C-\><C-n>
endif

"let g:airline_theme='simple'
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#buffer_nr_format = '%s. '
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'
"let g:airline#extensions#tabline#formatter='default'

let g:airline_theme='wpgtk'
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_powerline_fonts = 1
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.modified = ' '
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#unicode#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#hunks#enabled = 1
"extension settings
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let airline#extensions#coc#warning_symbol = ':'
let airline#extensions#coc#error_symbol = ':'
let g:airline#extensions#hunks#hunk_symbols = [':', ':', ':']
let g:airline#extensions#branch#format = 2

let g:gitgutter_enabled = 1
let g:gitgutter_grep=''

nmap <C-n> :NERDTreeToggle<CR>
