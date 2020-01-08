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

call plug#end()

"if executable('rls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'rls',
"        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
"        \ 'whitelist': ['rust'],
"        \ })
"endif

"let g:lsp_settings = {
"	\'pyls': {'cmp': ['pyls']}
"	\}

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': ['/home/andrei/.local/share/nvim/plugged/vim-lsp-settings/servers/pyls/pyls'],
        \ 'whitelist': ['python'],
        \ })
endif

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'

nmap <C-n> :NERDTreeToggle<CR>
