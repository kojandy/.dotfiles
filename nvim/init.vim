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

    nmap <silent> <C-n> :NERDTreeToggle<CR>
Plug 'junegunn/fzf'
    let $FZF_DEFAULT_OPTS='--reverse'
    let g:fzf_layout={'window': {'width': 0.8, 'height': 0.5}}
Plug 'junegunn/fzf.vim'
    nmap <silent> <Leader>ff :Files<CR>
    nmap <silent> <Leader>fb :Buffers<CR>
    nmap <silent> <Leader>fl :BLines<CR>
    nmap <Leader>fr :Rg<Space>
    nmap <silent> <Leader>ft :BTags<CR>
    nmap <silent> <Leader>fT :Tags<CR>
    nmap <silent> <Leader>fh :History<CR>
    nmap <silent> <Leader>f: :History:<CR>
    nmap <silent> <Leader>f/ :History/<CR>
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
    nmap <silent> <Leader>tt :TagbarToggle<CR>
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
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    nmap <silent> [d <Plug>(coc-diagnostic-prev)
    nmap <silent> ]d <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)
    nmap <Leader>ca <Plug>(coc-codeaction)
    nmap <Leader>cf <Plug>(coc-format)
    nmap <Leader>cr <Plug>(coc-rename)
    nmap <silent> <Leader>cd :CocList diagnostics<CR>
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
Plug 'fatih/vim-go'
    let g:go_code_completion_enabled=0
    let g:go_def_mapping_enabled=0
    let g:go_doc_keywordprg_enabled=0
    let g:go_gopls_enabled=0
    let g:go_template_autocreate=0
" }}}

" git {{{
Plug 'tpope/vim-fugitive'
    nmap <silent> <Leader>gs :Git<CR>
    nmap <silent> <Leader>gc :Gcommit --verbose<CR>
    nmap <silent> <Leader>gr :Gread<CR>
    nmap <silent> <Leader>gw :Gwrite<CR>
    nmap <silent> <Leader>ge :Gedit<CR>
    nmap <silent> <Leader>gd :Gdiff<CR>
    nmap <silent> <Leader>gb :Gblame<CR>
    nmap <silent> <Leader>gp :Gpush<CR>
    nmap <silent> <Leader>gl :Gpull<CR>
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

" ?ie; entire object
" https://github.com/junegunn/dotfiles/blob/master/vimrc
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-u>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>
" }}}

" autocmd {{{
autocmd FileType * set formatoptions-=c fo-=r fo-=o " disable comment continuation
" }}}

" ui {{{
set nowrap
set scrolloff=3
set noshowmode
set number
set cursorline

set list
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

set termguicolors
colorscheme aurora

if has('mouse')
    set mouse=a
endif
" }}}

" indent and tab {{{
set shiftwidth=4
set tabstop=4
set expandtab
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
