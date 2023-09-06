return {
  -- browse
  {'stevearc/oil.nvim', lazy = false, keys = {{'-', '<Cmd>Oil<CR>'}}, config = true},
  {'folke/trouble.nvim', cmd = {'Trouble', 'TroubleToggle'},
    keys = {
      {'<Leader>sq', '<Cmd>TroubleToggle quickfix<CR>'},
      {'<Leader>sl', '<Cmd>TroubleToggle loclist<CR>'},
    },
    opts = {
      icons = false,
      padding = false,
      cycle_results = false,
      fold_open = '-',
      fold_closed = '+',
      indent_lines = false,
      signs = {
          error = 'ERROR',
          warning = 'WARN',
          hint = 'HINT',
          information = 'INFO',
          other = '-',
      },
      use_diagnostic_signs = false
    },
  },
  {'folke/todo-comments.nvim', cmd = {'TodoTrouble', 'TodoTelescope'}, dependencies = {'nvim-lua/plenary.nvim'},
    keys = {
      {'<Leader>st', '<Cmd>TodoTrouble<CR>'}
    },
    opts = {
      signs = false,
      keywords = {
        FIX = {icon = ''},
        TODO = {icon = ''},
        HACK = {icon = ''},
        WARN = {icon = ''},
        PERF = {icon = ''},
        NOTE = {icon = ''},
        TEST = {icon = ''},
      },
    },
  },

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
  {'lambdalisue/suda.vim', cmd = 'WW', config = function()
    vim.cmd.command('WW', 'execute "SudaWrite" | edit!')
  end},
  {'hrsh7th/nvim-cmp', event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    opts = function()
      local cmp = require('cmp')
      return {
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-D>'] = cmp.mapping.scroll_docs(2),
          ['<C-U>'] = cmp.mapping.scroll_docs(-2),
        }),
        sources = cmp.config.sources({
          {name = 'nvim_lsp'},
          {name = 'buffer'},
          {name = 'path'},
        }),
      }
  end},

  -- language
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', event = {'BufReadPost', 'BufNewFile'},
    opts = {
      ensure_installed = {'bash', 'python', 'lua', 'nix'},
      highlight = {enable = true},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = false,
          node_decremental = '<BS>',
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
  {'tpope/vim-fugitive',
    keys = {
      {'<Leader>gs', '<Cmd>Git<CR>'},
      {'<Leader>gc', '<Cmd>Git commit --verbose<CR>'},
      {'<Leader>gr', '<Cmd>Gread<CR>'},
      {'<Leader>gw', '<Cmd>Gwrite<CR>'},
      {'<Leader>gd', '<Cmd>Gvdiffsplit<CR>'},
      {'<Leader>gb', '<Cmd>Git blame<CR>'},
      {'<Leader>gl', '<Cmd>Gclog %<CR>'},
      {'<Leader>gL', '<Cmd>Gclog<CR>'},
    },
    config = function()
      vim.cmd([[
        augroup fugitive_conf
          autocmd!
          autocmd FileType fugitive* nmap <buffer> <nowait> q gq
        augroup END
      ]])
    end
  },
  {'lewis6991/gitsigns.nvim', dependencies = {'nvim-lua/plenary.nvim'}, event = {'BufReadPre', 'BufNewFile'}, config = true,
    keys = {
      {'[c', '<Cmd>lua require"gitsigns".prev_hunk()<CR>'},
      {']c', '<Cmd>lua require"gitsigns".next_hunk()<CR>'},

      {'<Leader>hs', '<Cmd>lua require"gitsigns".stage_hunk()<CR>'},
      {'<Leader>hu', '<Cmd>lua require"gitsigns".reset_hunk()<CR>'},
      {'<Leader>hh', '<Cmd>lua require"gitsigns".preview_hunk()<CR>'},
    },
  },

  -- visuals
  {'declancm/cinnamon.nvim', event = 'VeryLazy', opts = {max_length = 100}},
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
  {'lukas-reineke/indent-blankline.nvim', opts = {
    show_current_context = true,
    context_highlight_list = {'Comment'},
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
