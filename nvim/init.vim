lua require('ensure_packer')

" coc {{{
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent> <expr> <Tab>
            \ pumvisible() ? "\<C-N>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
inoremap <silent> <expr> <CR>
            \ pumvisible() ? coc#_select_confirm() :
            \ "\<C-G>u\<CR>\<C-R>=coc#on_enter()\<CR>"

nnoremap K <Cmd>call CocAction('doHover')<CR>
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
set signcolumn=yes
set nofoldenable
set shortmess+=c

set list
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

set termguicolors

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

" disable comment continuation
autocmd BufEnter * set formatoptions-=r fo-=o
" }}}

" terminal {{{
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

" . also loves visual mode
vnoremap . :norm .<CR>

" readline-style key bindings
cnoremap <C-A> <Home>

" https://github.com/beauwilliams/Dotfiles/blob/056cf2ba605115ef2454c69d5d07c06c09287034/Vim/nvim/init.vim#L708
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd " . a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd " . a:key
    endif
endfunction

" easy move with splits
nnoremap <C-H> <Cmd>call WinMove('h')<CR>
nnoremap <C-J> <Cmd>call WinMove('j')<CR>
nnoremap <C-K> <Cmd>call WinMove('k')<CR>
nnoremap <C-L> <Cmd>call WinMove('l')<CR>
nnoremap <C-W><C-Q> <Cmd>close<CR>
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
nnoremap - <Cmd>Explore<CR>

let mapleader=' '
" <Leader>f - find
nmap <Leader>ff <Cmd>Files<CR>
nmap <Leader>fg <Cmd>GFiles?<CR>
nmap <Leader>fb <Cmd>Buffers<CR>
nmap <Leader>fl <Cmd>BLines<CR>
nmap <Leader>fL <Cmd>Lines<CR>
nmap <Leader>fr <Cmd>RG<CR>
nmap <Leader>ft <Cmd>BTags<CR>
nmap <Leader>fT <Cmd>Tags<CR>
nmap <Leader>fh <Cmd>History<CR>
nmap <Leader>fs <Cmd>Vista finder<CR>

" <Leader>s - show
nmap <Leader>sa <Plug>(coc-codeaction)
xmap <leader>sa <Plug>(coc-codeaction-selected)
nmap <Leader>sd <Cmd>CocList diagnostics<CR>
nmap <Leader>so <Cmd>CocList outline<CR>
nmap <Leader>ss <Cmd>Vista!!<CR>
nmap <Leader>sh <Cmd>SignifyHunkDiff<CR>

" <Leader>a - action
nmap <Leader>af <Plug>(coc-format)
xmap <leader>af <Plug>(coc-format-selected)
nmap <Leader>ar <Plug>(coc-rename)

" <Leader>y - toggle
nmap <Leader>yw <Cmd>set wrap!<CR>
nmap <Leader>yn <Cmd>set number!<CR>
nmap <Leader>yr <Cmd>set relativenumber!<CR>
nmap <Leader>yh <Cmd>SignifyToggle<CR>

" <Leader>g - git
nmap <Leader>gs <Cmd>Git<CR>
nmap <Leader>gc <Cmd>Git commit --verbose<CR>
nmap <Leader>gr <Cmd>Gread<CR>
nmap <Leader>gw <Cmd>Gwrite<CR>
nmap <Leader>gd <Cmd>Gvdiffsplit<CR>
nmap <Leader>gb <Cmd>Git blame<CR>
nmap <Leader>gl <Cmd>Gclog<CR>

" <Leader>h - hunk
nmap <Leader>hf <Cmd>SignifyFold<CR>
nmap <Leader>hu <Cmd>SignifyHunkUndo<CR>
" }}}
" }}}
" vim:fdm=marker
