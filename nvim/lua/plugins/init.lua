return {
  -- autocomplete, format, edit
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  {'chaoren/vim-wordmotion', event = 'VeryLazy', init = function()
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
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', event = {'BufReadPost', 'BufNewFile'},
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
  {'tpope/vim-fugitive', event = 'VeryLazy', config = function()
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
    vim.keymap.set('n', '<Leader>gl', '<Cmd>Gclog %<CR>')
    vim.keymap.set('n', '<Leader>gL', '<Cmd>Gclog<CR>')
  end},
  {'lewis6991/gitsigns.nvim', dependencies = {'nvim-lua/plenary.nvim'}, event = {'BufReadPre', 'BufNewFile'}, opts = {
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
  {'declancm/cinnamon.nvim', opts = {max_length = 100}},
  'romainl/vim-cool',
  {'akinsho/bufferline.nvim', version = 'v3.*', event = 'VeryLazy',
    keys = {
      {'<M-k>', '<Cmd>BufferLineCyclePrev<CR>'},
      {'<M-j>', '<Cmd>BufferLineCycleNext<CR>'},
      {'<M-o>', ':set modified<CR>:silent! %bd<CR>:<Esc>'},
      {'<M-w>', '<Cmd>bd<CR>'},
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        always_show_bufferline = false,
      },
    }},

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
