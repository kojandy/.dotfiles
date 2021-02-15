local actions = require('telescope.actions')

require'telescope'.setup{
    defaults = {
        prompt_position = "top",
        sorting_strategy = "ascending",
        scroll_strategy = nil, -- not working?
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    }
}
