return {
  {'neovim/nvim-lspconfig', event = {'BufReadPre', 'BufNewFile'}, config = function()
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {}
    lspconfig.jdtls.setup {}
  end},
}
-- vim:ts=2:sts=2:sw=2
