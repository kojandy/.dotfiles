vim.cmd 'packadd packer.nvim'

return require'packer'.startup(function()
    use {'wbthomason/packer.nvim',
        opt = true,
        config = 'require("plugins")',
        cmd = 'PackerSync',
    }

    -- find, navigate
    use {'junegunn/fzf', config = function()
        vim.env.FZF_DEFAULT_OPTS = '--reverse'
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
    use {'neoclide/coc.nvim', branch = 'release', config = function()
        vim.g.coc_user_config = {
            diagnostic = {
                enableMessage = 'jump',
                virtualText = true,
                virtualTextLines = 1,
            }
        }
    end}
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use {'chaoren/vim-wordmotion', config = function()
        vim.g.wordmotion_prefix = '<Leader>'
    end}
    use 'wellle/targets.vim'
    use {'cohama/lexima.vim', config = function()
        vim.g.lexima_enable_basic_rules = 0
    end}

    -- language
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = 'require("plugins.treesitter")'}
    use 'metakirby5/codi.vim'

    -- git
    use {'tpope/vim-fugitive', config = function()
        vim.cmd 'autocmd FileType fugitive* nmap <buffer> <nowait> q gq'
    end}
    use {'mhinz/vim-signify', config = function()
        vim.g.signify_sign_change = '~'
        vim.cmd 'highlight link SignifySignAdd GitGutterAdd'
        vim.cmd 'highlight link SignifySignChange GitGutterChange'
        vim.cmd 'highlight link SignifySignDelete GitGutterDelete'
    end}

    -- visuals
    use 'psliwka/vim-smoothie'
    use 'romainl/vim-cool'
    use {'machakann/vim-highlightedyank', config = function()
        vim.g.highlightedyank_highlight_duration = 200
        vim.cmd 'highlight link HighlightedyankRegion Search'
    end}
    use {'romgrk/barbar.nvim',
        event = 'BufAdd *',
        setup = function()
            vim.g.bufferline = {
                icons = false,
                auto_hide = true,
                closable = false,
                animation = false,
            }
            vim.cmd 'nnoremap <silent> <C-S> <Cmd>BufferPick<CR>'
        end
    }

    -- colorscheme
    -- use {'rafalbromirski/vim-aurora', config = 'vim.cmd [[colorscheme aurora]]'}
    -- use {'cocopon/iceberg.vim', config = 'vim.cmd [[colorscheme iceberg]]'}
    -- use {'koirand/tokyo-metro.vim', config = 'vim.cmd [[colorscheme tokyo-metro]]'}
    -- use {'phanviet/vim-monokai-pro', config = 'vim.cmd [[colorscheme monokai_pro]]'}
    use {'ayu-theme/ayu-vim', config = function()
        vim.cmd 'colorscheme ayu'
        vim.cmd 'highlight clear SignColumn'
    end}
    -- use {'jacoborus/tender.vim', config = 'vim.cmd [[colorscheme tender]]'}
    -- use {'w0ng/vim-hybrid', config = 'vim.cmd [[colorscheme hybrid]]'}
    -- use {'vim-scripts/rootwater.vim', config = 'vim.cmd [[colorscheme rootwater]]'}
    -- use {'hzchirs/vim-material', config = function()
    --     vim.g.material_style = 'oceanic'
    --     vim.cmd 'colorscheme vim-material'
    -- end}
    -- use {'arzg/vim-colors-xcode', config = 'vim.cmd [[colorscheme xcodedark]]'}
    -- use {'zeis/vim-kolor', config = 'vim.cmd [[colorscheme kolor]]'}
end)
