return {
  {'neovim/nvim-lspconfig', event = {'BufReadPre', 'BufNewFile'}, config = function()
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {}
    lspconfig.jdtls.setup {}

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts)
        vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', opts)
        vim.keymap.set('n', 'gy', '<Cmd>Telescope lsp_type_definitions<CR>', opts)

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('i', '<C-K>', vim.lsp.buf.signature_help, opts)

        vim.keymap.set('n', '<Leader>ar', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<Leader>af', function() vim.lsp.buf.format {async = true} end, opts)
      end})
  end},
}
-- vim:ts=2:sts=2:sw=2
