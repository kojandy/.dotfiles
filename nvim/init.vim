let mapleader=' '
" <Leader>f - find
" <Leader>s - show
    " s - symbol
    " d - diagnostic
    " a - (code) action
    " h - hunk
    " f - file
" <Leader>a - action
    " r - rename
    " f - format
" <Leader>y - toggle
    " w - wrap
    " n - number
    " r - relativenumber
    " g - gutter
" <Leader>g - git
" <Leader>h - hunk
    " u - undo
    " s - stage

" plug {{{
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin(stdpath('data') . '/plugged')
" find / navigate {{{
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
    let $FZF_DEFAULT_OPTS='--reverse'
    let g:fzf_layout={'window': {'width': 0.8, 'height': 0.5}}
Plug 'junegunn/fzf.vim'
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

    nmap <Leader>ff <Cmd>Files<CR>
    nmap <Leader>fg <Cmd>GFiles?<CR>
    nmap <Leader>fb <Cmd>Buffers<CR>
    nmap <Leader>fl <Cmd>BLines<CR>
    nmap <Leader>fL <Cmd>Lines<CR>
    nmap <Leader>fr :Rg<Space>
    nmap <Leader>fR <Cmd>RG<CR>
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
    let g:coc_global_extensions=[
                \ 'coc-actions', 'coc-git',
                \ ]
    let g:coc_user_config={
                \ 'diagnostic.enableMessage': 'jump',
                \ 'diagnostic.virtualText': v:true,
                \ 'diagnostic.virtualTextLines': 1,
                \
                \ 'git.enableGlobalStatus': v:false,
                \ 'git.addedSign.hlGroup': 'GitGutterAdd',
                \ 'git.changedSign.hlGroup': 'GitGutterChange',
                \ 'git.removedSign.hlGroup': 'GitGutterDelete',
                \ 'git.topRemovedSign.hlGroup': 'GitGutterDelete',
                \ 'git.changeRemovedSign.hlGroup': 'GitGutterChangeDelete',
                \ }

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
    nmap <Leader>af <Plug>(coc-format)
    xmap <leader>af <Plug>(coc-format-selected)
    nmap <Leader>ar <Plug>(coc-rename)
    nmap <Leader>sa <Cmd>CocCommand actions.open<CR>
    xmap <leader>sa :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <Leader>sd <Cmd>CocList diagnostics<CR>
    nmap <Leader>so <Cmd>CocList outline<CR>

    nmap [c <Plug>(coc-git-prevchunk)
    nmap ]c <Plug>(coc-git-nextchunk)
    nmap <Leader>sh <Plug>(coc-git-chunkinfo)
    nmap <Leader>hu <Cmd>CocCommand git.chunkUndo<CR>
    nmap <Leader>hs <Cmd>CocCommand git.chunkStage<CR>
    nmap <Leader>yh <Cmd>CocCommand git.toggleGutters<CR>
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
Plug 'lervag/vimtex'
Plug 'metakirby5/codi.vim'
" }}}

" git {{{
Plug 'tpope/vim-fugitive'
    nmap <Leader>gs <Cmd>Git<CR>
    nmap <Leader>gc <Cmd>Git commit --verbose<CR>
    nmap <Leader>gr <Cmd>Gread<CR>
    nmap <Leader>gw <Cmd>Gwrite<CR>
    nmap <Leader>gd <Cmd>Gvdiffsplit<CR>
    nmap <Leader>gb <Cmd>Git blame<CR>
    nmap <Leader>gl <Cmd>Gclog<CR>
    autocmd FileType fugitive* nmap <buffer> <nowait> q gq
Plug 'rhysd/conflict-marker.vim'
" }}}

" colorscheme {{{
" Plug 'koirand/tokyo-metro.vim'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'tomasiser/vim-code-dark'
" Plug 'cocopon/iceberg.vim'
Plug 'rafalbromirski/vim-aurora'
" Plug 'ayu-theme/ayu-vim'
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
set noruler

set list
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

set termguicolors
colorscheme aurora

set mouse=a

let g:netrw_banner=0
let g:netrw_list_hide='^\./$,^\.\./$'

set statusline=%f\ %m%=%l/%L
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
autocmd FileType * set formatoptions-=r fo-=o
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

    autocmd BufEnter <buffer> startinsert
    autocmd BufLeave <buffer> stopinsert
    tnoremap <buffer> <C-L> <C-\><C-N><C-W>l
    startinsert
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

nnoremap <S-Tab> <Cmd>call MonkeyTerminalToggle()<CR>
tnoremap <S-Tab> <Cmd>call MonkeyTerminalToggle()<CR>
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

" annoying
call s:command_alias("W", "w")
" write file with privilege
silent! command WW execute 'silent! write !sudo tee % >/dev/null' | edit!

nnoremap Y y$

" move lines
xnoremap <silent> <C-K> :move-2<CR>gv
xnoremap <silent> <C-J> :move'>+<CR>gv
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

" easy with tabs
nnoremap <M-h> <Cmd>tabprevious<CR>
nnoremap <M-j> <Cmd>tabnew<CR>
nnoremap <M-k> <Cmd>-tabnew<CR>
nnoremap <M-l> <Cmd>tabnext<CR>
nnoremap <M-H> <Cmd>-tabmove<CR>
nnoremap <M-L> <Cmd>+tabmove<CR>
nnoremap <M-o> <Cmd>tabonly<CR>
nnoremap <M-w> <Cmd>tabclose<CR>

" ?ie; entire object
" https://github.com/junegunn/dotfiles/blob/master/vimrc
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" leader mappings
nnoremap <Leader>sf <Cmd>Explore<CR>
nnoremap <Leader>yw <Cmd>set wrap!<CR>
nnoremap <Leader>yn <Cmd>set number!<CR>
nnoremap <Leader>yr <Cmd>set relativenumber!<CR>
" }}}
" }}}
" vim:fdm=marker
