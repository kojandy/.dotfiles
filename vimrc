" plug
if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-bufferline'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'johngrib/vim-f-hangul'
Plug 'rstacruz/vim-closer'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/clever-f.vim'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-signify'

" colorscheme
Plug 'nanotech/jellybeans.vim'
Plug 'koirand/tokyo-metro.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'tomasiser/vim-code-dark'

" Try later
" Plug 'itchyny/lightline.vim'
" Plug 'Shougo/deoplete.nvim'
" Plug 'SirVer/ultisnips'
call plug#end()

" general
set nowrap
set laststatus=2
set showcmd
set autoread
set scrolloff=3
set wildmenu
set wildmode=longest:full,full
set noshowmode
set relativenumber
set number
set hidden
set wildignore+=*.swp,*.pyc,*.zip,venv,.git
set backspace=indent,eol,start
set cursorline

" syntax highlight
syntax on
colorscheme tokyo-metro

" indent and tab
filetype indent plugin on
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" search
set ignorecase
set smartcase
set hlsearch
set incsearch

" mouse
if has('mouse')
    set mouse=a
endif

" disable comment continuation
au FileType * set fo-=c fo-=r fo-=o

" keymap
let mapleader=','
noremap <silent> <SPACE> :noh<CR>
nmap <silent> <leader>af :Autoformat<CR>

" airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
let g:airline_exclude_preview = 1

" autoformat
let g:formatdef_astyle = '"astyle -A2SLYMpHjoxC200"'
let g:formatters_java = ['astyle']
let g:formatters_cpp = ['astyle']
let g:formatters_c = ['astyle']
let g:formatters_python = ['autopep8']

" nerdtree
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
nmap <silent> <C-n> :NERDTreeToggle<CR>

" fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>ge :Gedit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gp :Gpush<CR>
nmap <silent> <leader>gl :Gpull<CR>

" undotree
nmap <silent> <C-q> :UndotreeToggle<CR>:UndotreeFocus<CR>

" emmet-vim
let g:user_emmet_leader_key='<C-e>'

" vim-closer
au FileType kotlin
            \ let b:closer = 1 |
            \ let b:closer_flags = '([{'

" ale
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ }
