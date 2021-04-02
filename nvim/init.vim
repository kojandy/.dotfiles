lua require('ensure_packer')

set hidden
set wildmode=longest:full,full
set updatetime=100

" ui
set scrolloff=3
set sidescroll=0
set noshowmode
set cursorline
set noruler
set signcolumn=yes
set nofoldenable
set list
set shortmess+=c
set termguicolors
set mouse=a
set statusline=%f\ %m%=%l/%L

" search
set ignorecase
set smartcase
set inccommand=nosplit

" format, edit, wrap
set shiftwidth=4
set tabstop=4
set expandtab
set nowrap
set linebreak
set breakindent

" netrw
let g:netrw_banner=0
let g:netrw_list_hide='^\./$,^\.\./$'

augroup vimrc
    autocmd!
    autocmd InsertEnter * set nolist
    autocmd InsertLeave * set list
    " disable comment continuation
    autocmd BufEnter * set formatoptions-=r fo-=o
augroup END

" annoying
command W w
" write file with privilege
silent! command WW execute 'silent! write !sudo tee % >/dev/null' | edit!

" sane defaults
nnoremap Y y$
nnoremap q: <Nop>
nnoremap Q <Nop>
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>
vnoremap . :norm .<CR>
cnoremap <C-A> <Home>

" move lines
xnoremap <silent> <C-K> :move-2<CR>gv
xnoremap <silent> <C-J> :move'>+<CR>gv
xnoremap < <gv
xnoremap > >gv

" monkey terminal
nnoremap <S-Tab> <Cmd>call MonkeyTerminalToggle()<CR>
tnoremap <S-Tab> <Cmd>call MonkeyTerminalToggle()<CR>

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

" ?ie; entire object
" https://github.com/junegunn/dotfiles/blob/master/vimrc
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>
nnoremap - <Cmd>Explore<CR>

" coc
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

" <Leader>a - action
nmap <Leader>af <Plug>(coc-format)
xmap <leader>af <Plug>(coc-format-selected)
nmap <Leader>ar <Plug>(coc-rename)

" <Leader>y - toggle
nmap <Leader>yw <Cmd>set wrap!<CR>
nmap <Leader>yn <Cmd>set number!<CR>
nmap <Leader>yr <Cmd>set relativenumber!<CR>

" <Leader>g - git
nmap <Leader>gs <Cmd>Git<CR>
nmap <Leader>gc <Cmd>Git commit --verbose<CR>
nmap <Leader>gr <Cmd>Gread<CR>
nmap <Leader>gw <Cmd>Gwrite<CR>
nmap <Leader>gd <Cmd>Gvdiffsplit<CR>
nmap <Leader>gb <Cmd>Git blame<CR>
nmap <Leader>gl <Cmd>Gclog<CR>
