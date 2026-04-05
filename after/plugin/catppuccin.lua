-- https://github.com/catppuccin/nvim
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    integrations = {
	treesitter	= true,
	harpoon		= true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
