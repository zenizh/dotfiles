"
" dein.vim
"

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" call dein#add('joshdick/onedark.vim')
" call dein#add('joshdick/airline-onedark.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Yggdroot/indentLine')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('rking/ag.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('thinca/vim-visualstar')
call dein#add('tyru/caw.vim')
call dein#add('tyru/open-browser.vim')
call dein#add('rhysd/accelerated-jk')
call dein#add('edkolev/tmuxline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('mhinz/vim-startify')
call dein#add('b4b4r07/vim-hcl')

call dein#add('Shougo/neocomplete.vim',     { 'on_i': 1 })
call dein#add('Shougo/neosnippet.vim',      { 'on_i': 1 })
call dein#add('Shougo/neosnippet-snippets', { 'on_i': 1 })
call dein#add('tpope/vim-endwise',          { 'on_i': 1 })
call dein#add('Townk/vim-autoclose',        { 'on_i': 1 })

call dein#add('pangloss/vim-javascript',    { 'on_ft': 'javascript' })
call dein#add('mxw/vim-jsx',                { 'on_ft': 'javascript' })
call dein#add('osyo-manga/vim-monster',     { 'on_ft': 'ruby' })
call dein#add('todesking/ruby_hl_lvar.vim', { 'on_ft': 'ruby' })

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"
" General settings
"

syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set colorcolumn=80
set confirm
set cursorline
set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=eol:¬
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set nowrap
set number
set ruler
set scrolloff=4
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set wildmode=list:longest,full
" set wrap
set wrapscan

"
" Color scheme
"

" let g:onedark_termcolors=16

" colorscheme onedark

"
" Cursor
"

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"
" Keymaps
"

let mapleader = "\<Space>"

noremap j gj
noremap k gk
noremap <Leader>h ^
noremap <Leader>l $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>t :tabnew<CR>:Startify<CR>
nnoremap <Leader>F :Ag<Space>
nnoremap <Leader><Tab> <C-w>w
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
inoremap jj <ESC>

"
" Plugin settings
"

" vim-airline

let g:airline_theme = 'term'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0

" vim-fugitive

let g:airline#extensions#branch#enabled = 1

" nerdtree

let NERDTreeShowHidden = 1

nmap <Leader>n :NERDTreeToggle<CR>

" vim-nerdtree-tabs

let g:nerdtree_tabs_open_on_gui_startup = 0

if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

" neocomplete.vim

let g:neocomplete#enable_at_startup = 1

" ctrlp.vim

nnoremap <Leader>o :CtrlP<CR>

" accelerated-jk

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" open-browser.vim

map <Leader>b <Plug>(openbrowser-smart-search)

" vim-trailing-whitespace

autocmd BufWritePre * :FixWhitespace

" vim-monster

let g:neocomplete#sources#omni#input_patterns = {
\  'ruby': '[^. *\t]\.\w*\|\h\w*::'
\}

" caw.vim

map <Leader>/ <Plug>(caw:hatpos:toggle)

" vim-gitgutter

let g:gitgutter_map_keys = 0

" ag.vim

let g:ctrlp_use_caching=0
let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'

nmap <Leader>f :Ag<Space>

" vim-jsx

let g:jsx_ext_required = 0

"
" Bug fixes
"

" vim-multiple-cursors

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"
" vim-startify
"

nnoremap <Leader>h :Startify<CR>

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
  \   '~/.vimrc'
  \ ]

autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   NERDTree
  \ |   wincmd w
  \ | endif
