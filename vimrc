" plug
if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'rstacruz/vim-closer'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kojandy/clever-f.vim'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'alexdavid/vim-min-git-status', { 'on': 'Gministatus' }
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ervandew/supertab'
Plug 'mtth/scratch.vim'
Plug 'tmhedberg/matchit'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'maximbaz/lightline-trailing-whitespace'

" colorscheme
Plug 'nanotech/jellybeans.vim'
Plug 'koirand/tokyo-metro.vim', { 'commit': '59527e4' }
Plug 'phanviet/vim-monokai-pro'
Plug 'tomasiser/vim-code-dark'
Plug 'cocopon/iceberg.vim'

" Try later
" Plug 'SirVer/ultisnips'
call plug#end()

" general
set nowrap
set laststatus=2
set showtabline=2
set showcmd
set autoread
set scrolloff=3
set wildmenu
set wildmode=longest:full,full
set noshowmode
set relativenumber
set number
set hidden
set wildignore+=*.swp,*.pyc,*.zip,venv,.git,*.class
set backspace=indent,eol,start
set cursorline
set updatetime=100

" syntax highlight
syntax on
colorscheme iceberg

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
autocmd FileType * set fo-=c fo-=r fo-=o

" autoformat
let g:formatdef_astyle='"astyle -A2SLYMpHjoxC200"'
let g:formatters_java=['astyle']
let g:formatters_cpp=['astyle']
let g:formatters_c=['astyle']
let g:formatters_python=['autopep8']

" nerdtree
let NERDTreeIgnore=['\.pyc$']
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1

" emmet-vim
let g:user_emmet_leader_key='<C-e>'

" vim-closer
autocmd FileType kotlin
            \ let b:closer=1 |
            \ let b:closer_flags='([{'

" ale
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_fixers={
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ }

" bufferline
let g:bufferline_echo=0

" supertab
let g:SuperTabDefaultCompletionType="context"

" scratch
let g:scratch_persistence_file='/tmp/scratch.vim'
let g:scratch_no_mappings=1

" lightline
let s:p={
            \ 'normal': {
            \   'left': [['brightgreen', 'gray2', 'bold'], ['black', 'brightgreen'], ['red', 'white']],
            \   'middle': [['gray7', 'gray2']],
            \   'right': [['black', 'gray8']],
            \   'error': [['white', 'brightestred']],
            \   'warning': [['black', 'brightorange']]
            \ },
            \ 'inactive': {
            \   'left': [['gray7', 'gray2'], ['black', 'gray9']],
            \   'middle': [['gray7', 'gray2']],
            \   'right': []
            \ },
            \ 'insert': {
            \   'left': [['mediumcyan', 'gray2', 'bold'], ['black', 'mediumcyan'], ['red', 'white']],
            \   'middle': [['mediumcyan', 'darkestblue']],
            \   'right': [['darkestcyan', 'mediumcyan']]
            \ },
            \ 'visual': {
            \   'left': [['brightorange', 'gray2', 'bold'], ['black', 'brightorange'], ['red', 'white']],
            \   'middle': [['brightestorange', 'darkred']],
            \   'right': [['black', 'brightorange']]
            \ },
            \ 'replace': {
            \   'left': [['gray2', 'brightred', 'bold'], ['black', 'mediumcyan'], ['red', 'white']],
            \   'middle': [['mediumcyan', 'darkestblue']],
            \   'right': [['darkestcyan', 'mediumcyan']]
            \ },
            \ 'tabline': {
            \   'left': [['gray9', 'gray4']],
            \   'tabsel': [['gray9', 'gray1']],
            \   'middle': [['gray2', 'gray8']],
            \   'right': [['gray9', 'gray3']]
            \ }
            \ }
let g:lightline#colorscheme#custom#palette=lightline#colorscheme#fill(s:p)
let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#min_buffer_count=2
let g:lightline#trailing_whitespace#indicator='•'
let g:lightline={
            \ 'colorscheme': 'custom',
            \ 'component': {
            \   'lineinfo': "%{line('.') . '/' . line('$')}",
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'trailing': 'lightline#trailing_whitespace#component',
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'trailing': 'warning',
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \ },
            \ 'mode_map': {
            \   'n': 'N',
            \   'i': 'I',
            \   'R': 'R',
            \   'v': 'V',
            \   'V': 'V',
            \   "\<C-v>": 'V',
            \   'c': 'C',
            \   's': 'S',
            \   'S': 'S',
            \   "\<C-s>": 'S',
            \   't': 'T'
            \ },
            \ 'tabline': {'left': [['buffers']], 'right': [[]]},
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['gitbranch', 'filename'],
            \       ['readonly', 'modified']
            \   ],
            \   'right': [
            \       ['trailing', 'linter_warnings', 'linter_errors', 'lineinfo'],
            \       ['fileformat', 'fileencoding', 'filetype']
            \   ]
            \ },
            \ 'inactive': {
            \   'left': [['filename'], ['readonly', 'modified']],
            \   'right': [['lineinfo']]
            \ }
            \ }

" keymap
let mapleader="\<SPACE>"
nnoremap <SPACE> <Nop>
xnoremap <SPACE> <Nop>
nnoremap <silent> <CR> :noh<CR>
nmap <silent> <leader>af :Autoformat<CR>

nmap <silent> <C-n> :NERDTreeToggle<CR>

nmap <silent> <leader>uu :UndotreeToggle<CR>:UndotreeFocus<CR>

nmap <silent> <leader>gs :Gministatus<CR>
nmap <silent> <leader>gc :Gcommit --verbose<CR>
nmap <silent> <leader>gr :Gread<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>ge :Gedit<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gp :Gpush<CR>
nmap <silent> <leader>gl :Gpull<CR>

nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>fl :BLines<CR>
nmap <silent> <leader>fr :Rg<CR>
nmap <silent> <leader>ft :BTags<CR>

nmap <silent> <leader>ss :ScratchPreview<CR>
nmap <silent> <leader>sp :ScratchPreview<CR>
nmap <silent> <leader>si <plug>(scratch-insert-reuse)
nmap <silent> <leader>sI <plug>(scratch-insert-clear)
xmap <silent> <leader>si <plug>(scratch-selection-reuse)
xmap <silent> <leader>sI <plug>(scratch-selection-clear)

nmap <silent> <leader>tt :TagbarToggle<CR>
