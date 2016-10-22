"plug settings
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
call plug#end()

"airline settings
let g:airline_powerline_fonts = 1

"syntax highlight
if empty(glob("~/.vim/colors/jellybeans.vim"))
    execute '!curl -fLo ~/.vim/colors/jellybeans.vim --create-dirs https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim'
endif
if has("syntax")
    syntax on
endif
colorscheme jellybeans

"autoformat settings
let g:formatdef_astyle = '"astyle -A2YpHjxC100"'
let g:formatters_java = ['astyle']
let g:formatters_cpp = ['astyle']
let g:formatters_c = ['astyle']

"general settings
filetype indent plugin on
set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set number
set nowrap
set laststatus=2
set showcmd

"autocmd settings
autocmd BufWrite * :Autoformat

"keymap
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <Tab> <C-p>
