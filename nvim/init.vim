call plug#begin('~/.local/share/nvim/plugged')
"""""""""""
" Plugins "
"""""""""""
" Utility
Plug 'tpope/vim-vinegar'
Plug 'shougo/unite.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'

" Language stuff
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'
Plug 'udalov/kotlin-vim'
Plug 'lervag/vimtex'
Plug 'kovisoft/slimv'

" Autocomplete, Autoformatting and Linting
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

" Looks
Plug 'itchyny/lightline.vim'
Plug 'nerdypepper/agila.vim'
Plug 'itchyny/landscape.vim'
Plug 'nerdypepper/vim-colors-plain'
Plug 'olivertaylor/vacme'
Plug 'arzg/vim-colors-xcode'
Plug 'itchyny/vim-gitbranch'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'

" Misc
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

""""""""""""""""""""
" General Settings "
""""""""""""""""""""
set clipboard+=unnamedplus
set mouse=a
tnoremap <Esc> <C-\><C-n> " Escape exits terminal mode
set splitbelow splitright
set foldlevel=99

"""""""""
" Looks "
"""""""""
set number
set background=dark
syntax on
colorscheme agila 

" Lightline config
let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\ 'left': [ [ 'mode', 'paste' ],
	\ [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'gitbranch#name'
	\ },
	\ }

"""""""""""""""""""
" Auto Formatting "
"""""""""""""""""""
let g:rustfmt_autosave = 0
let g:neoformat_enabled_javascript = ['prettier']

"""""""""""""""""
" Auto Complete "
"""""""""""""""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Trigger autocomplete with Tab
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Cycle with Tab + S-Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Confirm with Enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""""""""""""""""""
" Language stuff "
""""""""""""""""""
" Rust
let g:rust_doc#downloaded_rust_doc_dir = '/home/nyx/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/doc/rust/'

" Javascript
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2

" Markdown
autocmd FileType markdown setlocal expandtab tabstop=2 shiftwidth=2

" C
autocmd FileType c setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType arduino setlocal expandtab tabstop=4 shiftwidth=4

" Haskell
autocmd FileType haskell set expandtab tabstop=8 shiftwidth=8

" Latex
autocmd FileType tex set expandtab tabstop=4 shiftwidth=4
" let g:vimtex_compiler_progname = 'nvr'
" let g:vimtex_compiler_latexmk_engines = {
"     \ '_'     : '-xelatex'
"     \}

" Kotlin
autocmd FileType kotlin set expandtab tabstop=4 shiftwidth=4

" Lisp
au FileType lisp let b:AutoPairs = {'"':'"'}

"""""""
" Ale "
"""""""

let g:ale_linters = {'rust': ['rls'], 'c': ['clangd']}
let g:ale_rust_rls_executable = '/usr/bin/rls'
let g:ale_rust_rls_toolchain = ''


"""""""""""""""
" Keybindings "
"""""""""""""""
let mapleader=" "
let maplocalleader="\<space>"

" Buffer switching
noremap <C-n> :bNext <CR>
noremap <C-p> :bprevious <CR>

" Easymotion
nmap f <Plug>(easymotion-bd-w)
map F <Plug>(easymotion-overwin-w)

" Unite docs for rust
map <Leader>d :Unite -start-insert -prompt-focus rust/doc <CR>

" Neoformat
map <Leader>f :Neoformat <CR>

" Goyo
map <Leader>G :Goyo <CR>

" CtrlP
map <Leader>o :FZF <CR>

" Multi Cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_quit_key            = ''
" Select all occurrences of highlighted word to modify
" Use * to mark all occurrences and then use <Space>R
map <Leader>R :MultipleCursorsFind <C-R>/<CR>

" TagBar
nmap <F8> :TagbarToggle <CR>
