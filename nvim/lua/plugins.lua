vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    -- find, navigate
    use {'junegunn/fzf', run = ':call fzf#install()', config = function()
        vim.cmd [[let $FZF_DEFAULT_OPTS='--reverse']]
    end}
    use {'junegunn/fzf.vim', config = function()
        vim.api.nvim_exec([[
            function! RipgrepFzf(query, fullscreen)
                let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
                let initial_command = printf(command_fmt, shellescape(a:query))
                let reload_command = printf(command_fmt, '{q}')
                let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
                call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
            endfunction

            command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
        ]], false)
    end}
    use {'liuchengxu/vista.vim', config = function()
        vim.g.vista_default_executive = 'coc'
        vim.g['vista#renderer#enable_icon'] = 0
    end}

    -- autocomplete, format, edit
    use 'AndrewRadev/splitjoin.vim'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use {'chaoren/vim-wordmotion', config = function()
        vim.g.wordmotion_prefix = '<Leader>'
    end}
    use 'wellle/targets.vim'
    use 'rstacruz/vim-closer'
    use 'tpope/vim-endwise'

    -- language
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = 'require("treesitter")'}
    use 'metakirby5/codi.vim'

    -- git
    use {'tpope/vim-fugitive', config = function()
        vim.cmd('autocmd FileType fugitive* nmap <buffer> <nowait> q gq')
    end}
    use {'mhinz/vim-signify', config = function()
        vim.g.signify_sign_change = '~'
        vim.cmd('highlight link SignifySignAdd GitGutterAdd')
        vim.cmd('highlight link SignifySignChange GitGutterChange')
        vim.cmd('highlight link SignifySignDelete GitGutterDelete')
    end}

    -- visuals
    use 'psliwka/vim-smoothie'
    use 'romainl/vim-cool'
    use {'machakann/vim-highlightedyank', config = function()
        vim.g.highlightedyank_highlight_duration = 200
        vim.cmd('highlight link HighlightedyankRegion Search')
    end}

    -- colorscheme
    use {'rafalbromirski/vim-aurora', config = 'vim.cmd [[colorscheme aurora]]'}
    -- use 'koirand/tokyo-metro.vim'
    -- use 'phanviet/vim-monokai-pro'
    -- use 'tomasiser/vim-code-dark'
    -- use 'cocopon/iceberg.vim'
    -- use 'ayu-theme/ayu-vim'
end)
