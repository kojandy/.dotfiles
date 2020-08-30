let mapleader=' '

" plug {{{
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin(stdpath('data') . '/plugged')
" find / navigate {{{
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
Plug 'liuchengxu/vista.vim'
    let g:vista_default_executive='coc'
    let g:vista#renderer#enable_icon=0
    nmap <Leader>ss <Cmd>Vista!!<CR>
    nmap <Leader>fs <Cmd>Vista finder<CR>
" }}}

" autocomplete / format / edit {{{
Plug 'AndrewRadev/splitjoin.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent> <expr> <Tab>
                \ pumvisible() ? "\<C-N>" :
                \ <SID>check_back_space() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
    nnoremap K <Cmd>call CocAction('doHover')<CR>
    nmap <silent> [d <Plug>(coc-diagnostic-prev)
    nmap <silent> ]d <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <Leader>= <Plug>(coc-format)
    nmap <Leader>rn <Plug>(coc-rename)
    nmap <Leader>ca <Plug>(coc-codeaction)
    nmap <Leader>cd <Cmd>CocList diagnostics<CR>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'chaoren/vim-wordmotion'
    let g:wordmotion_prefix='<Leader>'
Plug 'wellle/targets.vim'
Plug 'cohama/lexima.vim'
    let g:lexima_enable_basic_rules=0
" }}}

" visual {{{
Plug 'psliwka/vim-smoothie'
Plug 'romainl/vim-cool'
" }}}

" language {{{
Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled=['latex']
Plug 'lervag/vimtex'
" }}}

" git {{{
Plug 'tpope/vim-fugitive'
    nmap <Leader>gs <Cmd>Git<CR>
    nmap <Leader>gc <Cmd>Git commit --verbose<CR>
    nmap <Leader>gr <Cmd>Gread<CR>
    nmap <Leader>gw <Cmd>Gwrite<CR>
    nmap <Leader>gd <Cmd>Gvdiffsplit<CR>
    nmap <Leader>gb <Cmd>Git blame<CR>
    nmap <Leader>gp <Cmd>Git push<CR>
    nmap <Leader>gl <Cmd>Git pull<CR>
    autocmd FileType fugitive* nmap <buffer> <nowait> q gq
Plug 'mhinz/vim-signify'
    let g:signify_sign_change='~'
    let g:signify_priority=5
    nmap <Leader>hd <Cmd>SignifyHunkDiff<CR>
    nmap <Leader>hu <Cmd>SignifyHunkUndo<CR>
    highlight link SignifySignAdd GitGutterAdd
    highlight link SignifySignChange GitGutterChange
    highlight link SignifySignDelete GitGutterDelete
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

" ui {{{
set scrolloff=3
set sidescroll=0
set noshowmode
set cursorline

set list
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

set termguicolors
colorscheme aurora

set mouse=a

let g:netrw_banner=0
" }}}

" search {{{
set ignorecase
set smartcase
set inccommand=nosplit
" }}}

" format / edit / wrap {{{
set shiftwidth=4
set tabstop=4
set expandtab

set nowrap
set linebreak
set breakindent
set showbreak=↳

" disable comment continuation
autocmd FileType * set formatoptions-=c fo-=r fo-=o
" }}}

" language {{{
let g:tex_flavor='latex'
" }}}

" terminal {{{
let g:terminal_color_0="#282a2e"
let g:terminal_color_8="#373b41"
let g:terminal_color_1="#a54242"
let g:terminal_color_9="#cc6666"
let g:terminal_color_2="#8c9440"
let g:terminal_color_10="#b5bd68"
let g:terminal_color_3="#de935f"
let g:terminal_color_11="#f0c674"
let g:terminal_color_4="#5f819d"
let g:terminal_color_12="#81a2be"
let g:terminal_color_5="#85678f"
let g:terminal_color_13="#b294bb"
let g:terminal_color_6="#5e8d87"
let g:terminal_color_14="#8abeb7"
let g:terminal_color_7="#707880"
let g:terminal_color_15="#c5c8c6"

" monkey terminal {{{
" See: https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
let s:monkey_terminal_window=-1
let s:monkey_terminal_buffer=-1
let s:monkey_terminal_job_id=-1

function! MonkeyTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    noswapfile new monkey_terminal
    " Moves to the window the right the current one
    wincmd H
    let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

    " Change the name of the buffer to "Terminal"
    silent file Monkey\ Terminal
    " Gets the id of the terminal window
    let s:monkey_terminal_window = win_getid()
    let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
    set nonumber
  else
    if !win_gotoid(s:monkey_terminal_window)
      sp
      " Moves to the window below the current one
      wincmd H
      buffer Monkey\ Terminal
      " Gets the id of the terminal window
      let s:monkey_terminal_window = win_getid()
    endif
  endif
  startinsert
endfunction

function! MonkeyTerminalToggle()
  if win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalClose()
  else
    call MonkeyTerminalOpen()
  endif
endfunction

function! MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! MonkeyTerminalExec(cmd)
  if !win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalOpen()
  endif
  " run cmd
  call jobsend(s:monkey_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction

nnoremap <C-N> <Cmd>call MonkeyTerminalToggle()<CR>
tnoremap <C-N> <Cmd>call MonkeyTerminalToggle()<CR>
" }}}
" }}}

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
xnoremap <silent> <C-K> :move-2<CR>gv
xnoremap <silent> <C-J> :move'>+<CR>gv
xnoremap <silent> <C-H> <gv
xnoremap <silent> <C-L> >gv
xnoremap < <gv
xnoremap > >gv

" readline-style key bindings
cnoremap <C-A> <Home>

" play with numbers
nnoremap + <C-A>
nnoremap - <C-X>

" easy move with splits
nnoremap <C-H> <Cmd>wincmd h<CR>
nnoremap <C-J> <Cmd>wincmd j<CR>
nnoremap <C-K> <Cmd>wincmd k<CR>
nnoremap <C-L> <Cmd>wincmd l<CR>
tnoremap <C-]> <C-\><C-N>

" vim-unimpaired
nnoremap [ow <Cmd>set wrap<CR>
nnoremap ]ow <Cmd>set nowrap<CR>

" ?ie; entire object
" https://github.com/junegunn/dotfiles/blob/master/vimrc
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>
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
            \   "\<C-V>": 'V',
            \   'c': 'C',
            \   's': 'S',
            \   'S': 'S',
            \   "\<C-S>": 'S',
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
