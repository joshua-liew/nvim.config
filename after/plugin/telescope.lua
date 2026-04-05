-- refer to https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string(
        { search = vim.fn.input("Grep > ") }
    );
end, { desc = 'Telescope search for string in current working directory' })
