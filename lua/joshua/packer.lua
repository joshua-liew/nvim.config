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

  -- package manager for LSP servers etc.: mason
  -- https://github.com/mason-org/mason.nvim
  -- minimum dependencies: git, curl/wget, unzip, tar/gtar, gzip
  use {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }

  -- parser installer: tree-sitter-manager
  -- https://github.com/romus204/tree-sitter-manager.nvim
  -- nvim-treesitter is super buggy
  use "romus204/tree-sitter-manager.nvim"

  -- statusline: lightline https://github.com/itchyny/lightline.vim
  use {
    "itchyny/lightline.vim",
    requires = { {"itchyny/vim-gitbranch"} },
    config = function()
      vim.opt.showmode = false
      vim.g.lightline = {
        colorscheme = 'material',
        active = {
          left = {
            { 'mode', 'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified' }
          }
        },
        component_function = {
          gitbranch = 'gitbranch#name',
          filename = 'v:lua.relfilepath',
        }
      }

      -- display (buffer) relative filepath
      _G.relfilepath = function()
        local path = vim.fn.expand('%:.')
        return path ~= '' and path or '[No Name]'
      end
    end
  }

  -- focus: zen-mode https://github.com/folke/zen-mode.nvim?tab=readme-ov-file
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        plugins = {
          options = {
            laststatus = 3,
          },
          twilight = { enabled = false },
        },
      })
    end
  }

end)
