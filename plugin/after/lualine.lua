require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        'branch',
        'diff',
        {
            'diagnostics',
            update_in_insert = true,
            always_visible = true,
        },
    },
    lualine_c = {
        {
            'filename',
            newfile_statue = true,
            path = 1
        },
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'lsp_status', 'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Disable vim's default statusline
vim.opt.showmode = false
