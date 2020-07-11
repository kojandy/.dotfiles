let mapleader=' '

" plug {{{
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin(stdpath('data') . '/plugged')
" find / navigate {{{
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    let NERDTreeIgnore=['\.pyc$']
    let g:NERDTreeDirArrowExpandable='+'
    let g:NERDTreeDirArrowCollapsible='-'
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeMinimalUI=1

    nmap <C-n> <Cmd>NERDTreeToggle<CR>
Plug 'junegunn/fzf'
    let $FZF_DEFAULT_OPTS='--reverse'
    let g:fzf_layout={'window': {'width': 0.8, 'height': 0.5}}
Plug 'junegunn/fzf.vim'
    nmap <Leader>ff <Cmd>Files<CR>
    nmap <Leader>fb <Cmd>Buffers<CR>
    nmap <Leader>fl <Cmd>BLines<CR>
    nmap <Leader>fr :Rg<Space>
    nmap <Leader>ft <Cmd>BTags<CR>
    nmap <Leader>fT <Cmd>Tags<CR>
    nmap <Leader>fh <Cmd>History<CR>
    nmap <Leader>f: <Cmd>History:<CR>
    nmap <Leader>f/ <Cmd>History/<CR>
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
    nmap <Leader>tt <Cmd>TagbarToggle<CR>
Plug 'airblade/vim-rooter'
    let g:rooter_use_lcd=1
    let g:rooter_silent_chdir=1
Plug 'chaoren/vim-wordmotion'
    let g:wordmotion_prefix='<Leader>'
" }}}

" autocomplete / format / edit {{{
Plug 'AndrewRadev/splitjoin.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    inoremap <silent> <expr> <Tab>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
    nnoremap K <Cmd>call <SID>show_documentation()<CR>
    nmap <silent> [d <Plug>(coc-diagnostic-prev)
    nmap <silent> ]d <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)
    nmap <Leader>ca <Plug>(coc-codeaction)
    nmap <Leader>cf <Plug>(coc-format)
    nmap <Leader>cr <Plug>(coc-rename)
    nmap <Leader>cd <Cmd>CocList diagnostics<CR>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'cohama/lexima.vim'
    let g:lexima_enable_basic_rules=0
Plug 'wellle/targets.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'SirVer/ultisnips'
" }}}

" visual {{{
" Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'
Plug 'romainl/vim-cool'
" }}}

" language {{{
Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled=['latex']
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
" }}}

" git {{{
Plug 'tpope/vim-fugitive'
    nmap <Leader>gs <Cmd>Git<CR>
    nmap <Leader>gc <Cmd>Gcommit --verbose<CR>
    nmap <Leader>gr <Cmd>Gread<CR>
    nmap <Leader>gw <Cmd>Gwrite<CR>
    nmap <Leader>ge <Cmd>Gedit<CR>
    nmap <Leader>gd <Cmd>Gdiff<CR>
    nmap <Leader>gb <Cmd>Gblame<CR>
    nmap <Leader>gp <Cmd>Gpush<CR>
    nmap <Leader>gl <Cmd>Gpull<CR>
Plug 'mhinz/vim-signify'
    let g:signify_sign_change='~'
    nmap <Leader>hs <Cmd>SignifyHunkDiff<CR>
    nmap <Leader>hu <Cmd>SignifyHunkUndo<CR>
Plug 'rhysd/conflict-marker.vim'
" }}}

" statusbar {{{
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-trailing-whitespace'
" }}}

" colorscheme {{{
" Plug 'nanotech/jellybeans.vim'
" Plug 'koirand/tokyo-metro.vim', {'commit': '59527e4'}
" Plug 'phanviet/vim-monokai-pro'
" Plug 'tomasiser/vim-code-dark'
" Plug 'cocopon/iceberg.vim'
Plug 'rafalbromirski/vim-aurora'
" }}}
call plug#end()
" }}}

" general {{{
set hidden
set wildmode=longest:full,full
set updatetime=100

" keymap {{{
" no I don't need you
nnoremap q: <Nop>
nnoremap Q <Nop>
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>

function! s:command_alias(from, to)
    exec 'cnoreabbrev <expr> ' . a:from
                \ . ' getcmdtype() == ":" && getcmdline() == "' . a:from . '"'
                \ . '? "' . a:to . '" : "' . a:from . '"'
endfunction

" do not :write but :update the file
call s:command_alias("w", "update")
" annoying
call s:command_alias("W", "update")
" write file with privilege
silent! command WW execute 'silent! write !sudo tee % >/dev/null' | edit!

nnoremap Y y$

" move lines
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" readline-style key bindings
cnoremap <C-a> <Home>

" play with numbers
nnoremap + <C-a>
nnoremap - <C-x>

" easy move with splits
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" vim-unimpaired
nnoremap [ow <Cmd>set wrap<CR>
nnoremap ]ow <Cmd>set nowrap<CR>

" ?ie; entire object
" https://github.com/junegunn/dotfiles/blob/master/vimrc
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-u>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>
" }}}

" ui {{{
set scrolloff=3
set sidescroll=0
set noshowmode
set number
set cursorline

set list
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

set termguicolors
colorscheme aurora

set mouse=a
" }}}

" format / edit / wrap {{{
set shiftwidth=4
set tabstop=4
set expandtab

set nowrap
set linebreak
set breakindent
set breakindentopt=shift:2
let &showbreak='\ '

" disable comment continuation
autocmd FileType * set formatoptions-=c fo-=r fo-=o
" }}}

" search {{{
set ignorecase
set smartcase
set inccommand=nosplit
" }}}
" }}}

" lightline {{{
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
let g:lightline#trailing_whitespace#indicator='•'
let g:lightline={
            \ 'colorscheme': 'custom',
            \ 'component': {
            \   'lineinfo': "%{line('.') . '/' . line('$')}",
            \ },
            \ 'component_expand': {
            \   'trailing': 'lightline#trailing_whitespace#component',
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel',
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
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['gitbranch', 'filename'],
            \       ['readonly', 'modified']
            \   ],
            \   'right': [
            \       ['trailing', 'lineinfo'],
            \       ['fileformat', 'fileencoding', 'filetype']
            \   ]
            \ },
            \ 'inactive': {
            \   'left': [['filename'], ['readonly', 'modified']],
            \   'right': [['lineinfo']]
            \ }
            \ }
" }}}
" vim:fdm=marker
