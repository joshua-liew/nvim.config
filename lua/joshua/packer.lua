-- refer to https://github.com/wbthomason/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrap packer.nvim
-- refer to https://lazy.folke.io/installation
local packerpath = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if not (vim.uv or vim.loop).fs_stat(packerpath) then
  local packerrepo = "https://github.com/wbthomason/packer.nvim"
  local out = vim.fn.system({
    "git", "clone", "--depth", "1", packerrepo, packerpath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone packer.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(packerpath)

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


end)
