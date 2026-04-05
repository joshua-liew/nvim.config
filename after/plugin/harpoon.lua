-- refer to https://github.com/ThePrimeagen/harpoon/tree/harpoon2
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Keymaps
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon: Open harpoon window" })
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
    { desc = "Harpoon: Add harpoon window"})
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
    { desc = "Harpoon: Window 1"})
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end,
    { desc = "Harpoon: Window 2"})
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end,
    { desc = "Harpoon: Window 3"})
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end,
    { desc = "Harpoon: Window 4"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
