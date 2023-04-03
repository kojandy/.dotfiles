return {
  -- find, navigate
  {'junegunn/fzf', config = function()
    vim.env.FZF_DEFAULT_OPTS = '--reverse'
  end},
  {'junegunn/fzf.vim', config = function()
    vim.cmd([[
      function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
      endfunction

      command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
    ]])

    vim.keymap.set('n', '<Leader>ff', '<Cmd>Files<CR>')
    vim.keymap.set('n', '<Leader>fg', '<Cmd>GFiles?<CR>')
    vim.keymap.set('n', '<Leader>fb', '<Cmd>Buffers<CR>')
    vim.keymap.set('n', '<Leader>fl', '<Cmd>BLines<CR>')
    vim.keymap.set('n', '<Leader>fL', '<Cmd>Lines<CR>')
    vim.keymap.set('n', '<Leader>fr', '<Cmd>RG<CR>')
    vim.keymap.set('n', '<Leader>ft', '<Cmd>BTags<CR>')
    vim.keymap.set('n', '<Leader>fT', '<Cmd>Tags<CR>')
    vim.keymap.set('n', '<Leader>fh', '<Cmd>History<CR>')
  end},

  -- autocomplete, format, edit
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  {'chaoren/vim-wordmotion', config = function()
    vim.g.wordmotion_prefix = '<Leader>'
  end},
  'wellle/targets.vim',
  {'cohama/lexima.vim', config = function()
    vim.g.lexima_enable_basic_rules = 0
  end},
  {'lambdalisue/suda.vim', config = function()
    vim.cmd.command('WW', 'execute "SudaWrite" | edit!')
  end},

  -- language
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  opts = {
    highlight = {enable = true},
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  end},
  'metakirby5/codi.vim',

  -- git
  {'tpope/vim-fugitive', config = function()
    vim.cmd([[
      augroup fugitive_conf
        autocmd!
        autocmd FileType fugitive* nmap <buffer> <nowait> q gq
      augroup END
    ]])

    vim.keymap.set('n', '<Leader>gs', '<Cmd>Git<CR>')
    vim.keymap.set('n', '<Leader>gc', '<Cmd>Git commit --verbose<CR>')
    vim.keymap.set('n', '<Leader>gr', '<Cmd>Gread<CR>')
    vim.keymap.set('n', '<Leader>gw', '<Cmd>Gwrite<CR>')
    vim.keymap.set('n', '<Leader>gd', '<Cmd>Gvdiffsplit<CR>')
    vim.keymap.set('n', '<Leader>gb', '<Cmd>Git blame<CR>')
    vim.keymap.set('n', '<Leader>gl', '<Cmd>Gclog<CR>')
  end},
  {'lewis6991/gitsigns.nvim', dependencies = {'nvim-lua/plenary.nvim'}, opts = {
    signs = {
      add = {hl = 'GitGutterAdd'},
      change = {hl = 'GitGutterChange'},
      delete = {hl = 'GitGutterDelete'},
      topdelete = {hl = 'GitGutterDelete'},
      changedelete = {hl = 'GitGutterChange'},
    },
    keymaps = {
      noremap = true,
      buffer = true,

      ['n ]c'] = {expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n [c'] = {expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hh'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    },
  }},

  -- visuals
  'psliwka/vim-smoothie',
  'romainl/vim-cool',
  -- {'romgrk/barbar.nvim', event = 'BufAdd *', init = function()
  --   vim.g.bufferline = {
  --     icons = false,
  --     auto_hide = true,
  --     closable = false,
  --     animation = false,
  --   }
  --   vim.cmd 'nnoremap <M-k> <Cmd>BufferPrevious<CR>'
  --   vim.cmd 'nnoremap <M-j> <Cmd>BufferNext<CR>'
  --   vim.cmd 'nnoremap <M-o> <Cmd>BufferCloseAllButCurrent<CR>'
  --   vim.cmd 'nnoremap <M-w> <Cmd>BufferClose<CR>'
  -- end},

  -- colorscheme
  {'ayu-theme/ayu-vim', lazy = false, priority = 1000, config = function()
    vim.cmd('colorscheme ayu')
    vim.cmd('highlight clear SignColumn')
  end},
  -- {'rafalbromirski/vim-aurora', config = function() vim.cmd('colorscheme aurora') end},
  -- {'cocopon/iceberg.vim', config = function() vim.cmd('colorscheme iceberg') end},
  -- {'koirand/tokyo-metro.vim', config = function() vim.cmd('colorscheme tokyo-metro') end},
  -- {'phanviet/vim-monokai-pro', config = function() vim.cmd('colorscheme monokai_pro') end},
  -- {'jacoborus/tender.vim', config = function() vim.cmd('colorscheme tender') end},
  -- {'w0ng/vim-hybrid', config = function() vim.cmd('colorscheme hybrid') end},
  -- {'vim-scripts/rootwater.vim', config = function() vim.cmd('colorscheme rootwater') end},
  -- {'hzchirs/vim-material', config = function()
  --   vim.g.material_style = 'oceanic'
  --   vim.cmd('colorscheme vim-material')
  -- end},
  -- {'arzg/vim-colors-xcode', config = function() vim.cmd('colorscheme xcodedark') end},
  -- {'zeis/vim-kolor', config = function() vim.cmd('colorscheme kolor') end},
}
-- vim:ts=2:sts=2:sw=2
