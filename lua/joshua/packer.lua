-- refer to https://github.com/wbthomason/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrapping packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme: catppuccin https://github.com/catppuccin/nvim
  use { "catppuccin/nvim", as = "catppuccin" }

  -- fuzzy finder: telescope https://github.com/nvim-telescope/telescope.nvim
  -- other recommended dependencies below:
  -- ripgrep (rg): https://github.com/BurntSushi/ripgrep
  -- fd: https://github.com/sharkdp/fd
  use { "nvim-telescope/telescope.nvim", tag = "*",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim',
        opt = true,
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install',
      },
    }
  }

  -- file switcher: harpoon(2) https://github.com/ThePrimeagen/harpoon/tree/harpoon2
  use {
    "ThePrimeagen/harpoon", branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

end)
