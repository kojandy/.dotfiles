" plug settings
if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
call plug#end()

" airline settings
let g:airline_powerline_fonts = 1

" syntax highlight
if empty(glob("~/.vim/colors/jellybeans.vim"))
    silent !curl -fLo ~/.vim/colors/jellybeans.vim --create-dirs https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
endif
syntax on
colorscheme jellybeans

" autoformat settings
let g:formatdef_astyle = '"astyle -A2SLYMpHjxC200"'
let g:formatters_java = ['astyle']
let g:formatters_cpp = ['astyle']
let g:formatters_c = ['astyle']

" indent and tab settings
filetype indent plugin on
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" general settings
set number
set nowrap
set laststatus=2
set showcmd
set autoread
set scrolloff=3
set wildmenu
set wildmode=longest:full,full
set noshowmode
set hidden

" search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

if has('mouse')
    set mouse=a
endif

" autocmd settings
autocmd BufWrite * :Autoformat

" keymap
let mapleader=','
inoremap <Tab> <C-p>
noremap <SPACE> :noh<CR>

" nerdtree
nmap <silent> <C-n> :NERDTreeToggle<CR>

" fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>ge :Gedit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gp :Gpush<CR>
