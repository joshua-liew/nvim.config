return {
	-- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },

	-- Harpoon 2
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope.nvim', version = '*' },
		},
        config = true,
	},

	-- LSP/package manager
	{
		"mason-org/mason.nvim",
        config = true,
	},

	-- Tree-sitter manager
	{
		"romus204/tree-sitter-manager.nvim",
	},

	-- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

	-- Zen mode
	{
		"folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
          plugins = {
            options = {
              laststatus = 3,
            },
            twilight = { enabled = false },
          },
        },
	},

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },

    -- Which-key keymap helper
    {
        "folke/which-key.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            triggers = {},
        },
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signcolumn = true,
            numhl = true,
        },
    },

    -- Oil file manager
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        dependencies = { { "nvim-tree/nvim-web-devicons" }, },
        opts = {
            keymaps = {
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-t>"] = false,
                ["<C-p>"] = false,
                ["<C-c>"] = false,
                ["<C-l>"] = false,
            },
            view_options = {
                show_hidden = true,
            },
        },
    },

    -- Blink completion plugin
    {
        "saghen/blink.cmp",
        version = '1.*',
        opts_extend = { "sources.default" },
    },

    -- Formatter
    {
        "stevearc/conform.nvim",
    }
}

