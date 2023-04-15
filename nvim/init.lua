vim.g.mapleader = ' '

require('ensure_package_manager')

vim.opt.hidden = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.updatetime = 100

-- ui
vim.opt.scrolloff = 3
vim.opt.sidescroll = 0
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.ruler = false
vim.opt.signcolumn = 'yes'
vim.opt.foldenable = false
vim.opt.list = true
vim.opt.shortmess:append 'c'
vim.opt.termguicolors = true
vim.opt.mouse = 'nivh'
vim.opt.statusline = '%f %m%=%l/%L'
vim.opt.number = true
vim.opt.relativenumber = true

--  search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'nosplit'

-- format, edit, wrap
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0

local vimrc_augroup = vim.api.nvim_create_augroup('vimrc', {clear = true})
vim.api.nvim_create_autocmd('InsertEnter', {group = vimrc_augroup, pattern = '*', command = 'set nolist'})
vim.api.nvim_create_autocmd('InsertLeave', {group = vimrc_augroup, pattern = '*', command = 'set list'})
vim.api.nvim_create_autocmd('BufEnter', {group = vimrc_augroup, pattern = '*', command = 'set formatoptions-=r fo-=o'})
vim.api.nvim_create_autocmd('TextYankPost', {group = vimrc_augroup, pattern = '*', callback = function() vim.highlight.on_yank() end})

-- sane defaults
vim.cmd.command('W', 'w')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'q:', '<Nop>')
vim.keymap.set('n', 'Q', '<Nop>')
vim.keymap.set({'n', 'x'}, '<Space>', '<Nop>')
vim.keymap.set('v', '.', ':norm .<CR>', {silent = true})
vim.keymap.set('c', '<C-A>', '<Home>')
vim.keymap.set('n', '-', '<Cmd>Explore<CR>')

-- move lines
vim.keymap.set('x', '<C-K>', ':move-2<CR>gv', {silent = true})
vim.keymap.set('x', '<C-J>', ":move'>+<CR>gv", {silent = true})
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- ?ie; entire object
-- https://github.com/junegunn/dotfiles/blob/master/vimrc
vim.keymap.set('x', 'ie', 'gg0oG$')
vim.keymap.set('o', 'ie', ':<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>')

-- <Leader>y - toggle
vim.keymap.set('n', '<Leader>yw', '<Cmd>set wrap!<CR>')
vim.keymap.set('n', '<Leader>yn', '<Cmd>set number!<CR>')
vim.keymap.set('n', '<Leader>yr', '<Cmd>set relativenumber!<CR>')

-- easy move with splits
vim.keymap.set('n', '<C-H>', '<Cmd>call WinMove("h")<CR>')
vim.keymap.set('n', '<C-J>', '<Cmd>call WinMove("j")<CR>')
vim.keymap.set('n', '<C-K>', '<Cmd>call WinMove("k")<CR>')
vim.keymap.set('n', '<C-L>', '<Cmd>call WinMove("l")<CR>')
vim.keymap.set('n', '<C-W><C-Q>', '<Cmd>close<CR>')
vim.keymap.set('t', '<C-]>', '<C-\\><C-N>')

-- monkey terminal
vim.keymap.set({'n', 't'}, '<S-Tab>', '<Cmd>call MonkeyTerminalToggle()<CR>')
