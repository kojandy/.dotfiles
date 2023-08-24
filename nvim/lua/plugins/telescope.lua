return {
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim'},
    cmd = 'Telescope',
    keys = {
      {'<Leader>ff', '<Cmd>Telescope find_files<CR>'},
      {'<Leader>fg', '<Cmd>Telescope git_status<CR>'},
      {'<Leader>fb', '<Cmd>Telescope buffers<CR>'},
      {'<Leader>fl', '<Cmd>Telescope current_buffer_fuzzy_find<CR>'},
      {'<Leader>fL', '<Cmd>Telescope buffers<CR>'},
      {'<Leader>fr', '<Cmd>Telescope live_grep<CR>'},
      {'<Leader>fh', '<Cmd>Telescope oldfiles<CR>'},
      {'<Leader>fq', '<Cmd>Telescope quickfix<CR>'},
      {'<Leader>f:', '<Cmd>Telescope command_history<CR>'},
      {'<Leader>f/', '<Cmd>Telescope search_history<CR>'},
      {'<Leader>f<Space>', '<Cmd>Telescope resume<CR>'},
    },
    opts = {
      defaults = {
        layout_strategy = 'vertical_merged',
        sorting_strategy = 'ascending',
        path_display = {shorten = {len = 1, exclude = {1, -2, -1}}},
        dynamic_preview_title = true,
        results_title = false,
        layout_config = {vertical = {preview_height = 0.6, preview_cutoff = 18, prompt_position = 'top', mirror = true}},
        mappings = {
          i = {
            ['<C-J>'] = 'move_selection_next',
            ['<C-K>'] = 'move_selection_previous',
            ['<C-U>'] = false,
          },
        },
      },
      pickers = {
        lsp_definitions = {path_display = {'tail'}},
        lsp_references = {path_display = {'tail'}},
        lsp_implementations = {path_display = {'tail'}},
        lsp_type_definitions = {path_display = {'tail'}},
      },
    },
    config = function(_, opts)
      require('telescope.pickers.layout_strategies').vertical_merged = function(picker, max_columns, max_lines, layout_config)
        local layout = require('telescope.pickers.layout_strategies').vertical(picker, max_columns, max_lines, layout_config)

        layout.prompt.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

        layout.results.title = ''
        layout.results.borderchars = { '─', '│', '─', '│', '├', '┤', '┘', '└' }
        layout.results.line = layout.results.line - 1
        layout.results.height = layout.results.height + 1

        if layout[preview] ~= nil then
          layout.preview.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
        end

        return layout
      end

      require('telescope').setup(opts)
      require('telescope').load_extension('fzy_native')
    end
  },
}
-- vim:ts=2:sts=2:sw=2
