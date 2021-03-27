local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('echo "Installing packer.nvim..."')
    vim.cmd('silent !git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    local packer = require('plugins')
    vim.cmd('autocmd User PackerComplete qa')
    packer.sync()
end
