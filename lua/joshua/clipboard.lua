-- Reference: https://github.com/neovim/neovim/issues/19204

if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "clip (Copy Only)",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    cache_enabled = 0,
  }
end
