return {
  {'neovim/nvim-lspconfig', event = {'BufReadPre', 'BufNewFile'},
  dependencies = {
    {'williamboman/mason.nvim', cmd = 'Mason', build = ':MasonUpdate', config = true},
    {'williamboman/mason-lspconfig.nvim', opts = function()
      local lspconfig = require('lspconfig')
      return {
        ensure_installed = {'bashls'},
        handlers = {
          function(server_name)
            lspconfig[server_name].setup {}
          end,

          ['lua_ls'] = function()
            lspconfig.lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = {'vim', 'hs'}
                  },
                  workspace = {
                    library = {
                      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                      [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                      ['/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/'] = true,
                    }
                  }
                }
              },
            }
          end,

        },
      }
    end},
  },
  config = function()
    vim.keymap.set('n', '<Leader>sd', '<Cmd>TroubleToggle document_diagnostics<CR>')
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev {severity = "ERROR"} end)
    vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next {severity = "ERROR"} end)
    vim.api.nvim_create_autocmd('LspAttach', {

      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', 'gr', '<Cmd>TroubleToggle lsp_references<CR>', opts)
        vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', opts)
        vim.keymap.set('n', 'gy', '<Cmd>Telescope lsp_type_definitions<CR>', opts)

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('i', '<C-K>', vim.lsp.buf.signature_help, opts)

        vim.keymap.set({'n', 'v'}, '<M-CR>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<Leader>ar', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<Leader>af', function() vim.lsp.buf.format {async = true} end, opts)

        vim.keymap.set('n', '<Leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>', opts)
      end})
  end},
}
-- vim:ts=2:sts=2:sw=2
