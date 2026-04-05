-- refer to https://neovim.io/doc/user/lsp/#lsp-new-config

-- Lua LSP
vim.lsp.config['lua_ls'] = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        global = {
          'vim',
          'require',
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemtry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
}

-- Go LSP
vim.lsp.config['go_ls'] = {
  -- Command and arguments to start the server.
  cmd = { 'gopls' },
  -- Filetypes to automatically attach to.
  filetypes = { 'go' },
  root_markers = { { 'go.work', 'go.mod' }, '.vim', '.git', '.hg' },
}

vim.lsp.enable('lua_ls')
vim.lsp.enable('go_ls')

vim.diagnostic.config({ virtual_text = true })
