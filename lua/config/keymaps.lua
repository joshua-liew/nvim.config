vim.g.mapleader = " "

-- Vim motions
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "motion: move selection down",
})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "motion: move selection up",
})

vim.keymap.set("n", "J", "mzJ`z", {
    desc = "motion: join line below",
})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    desc = "motion: scroll down and center",
})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    desc = "motion: scroll up and center",
})

vim.keymap.set("n", "n", "nzzzv", {
    desc = "motion: next search result and center",
})

vim.keymap.set("n", "N", "Nzzzv", {
    desc = "motion: previous search result and center",
})

-- Oil
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", {
    desc = "oil: open parent directory",
})

-- Zenmode
vim.keymap.set("n", "<leader>zz", function()
    vim.cmd("ZenMode")
end, { desc = "zen-mode: toggle zen mode" })

-- Harpoon
vim.keymap.set("n", "<C-e>", function()
    local harpoon = require("harpoon")
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "harpoon: open quick menu" })

vim.keymap.set("n", "<leader>a", function()
    require("harpoon"):list():add()
end, { desc = "harpoon: add file" })

vim.keymap.set("n", "<C-h>", function()
    require("harpoon"):list():select(1)
end, { desc = "harpoon: select file 1" })

vim.keymap.set("n", "<C-j>", function()
    require("harpoon"):list():select(2)
end, { desc = "harpoon: select file 2" })

vim.keymap.set("n", "<C-k>", function()
    require("harpoon"):list():select(3)
end, { desc = "harpoon: select file 3" })

vim.keymap.set("n", "<C-l>", function()
    require("harpoon"):list():select(4)
end, { desc = "harpoon: select file 4" })

vim.keymap.set("n", "<C-S-P>", function()
    require("harpoon"):list():prev()
end, { desc = "harpoon: previous file" })

vim.keymap.set("n", "<C-S-N>", function()
    require("harpoon"):list():next()
end, { desc = "harpoon: next file" })

-- Telescope
vim.keymap.set("n", "<leader>pf", function()
    require("telescope.builtin").find_files()
end, { desc = "telescope: find files" })

vim.keymap.set("n", "<leader>ph", function()
    require("telescope.builtin").help_tags()
end, { desc = "telescope: help tags" })

vim.keymap.set("n", "<leader>pg", function()
    require("telescope.builtin").git_files()
end, { desc = "telescope: find git files" })

vim.keymap.set("n", "<leader>ps", function()
    require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep > "),
    })
end, { desc = "telescope: grep string" })

vim.keymap.set("n", "<leader>pl", function()
    require("telescope.builtin").live_grep()
end, { desc = "telescope: live grep" })

-- Blink.cmp
vim.keymap.set("i", "<C-space>", function()
    require("blink.cmp").show()
end, { desc = "blink.cmp: show completion menu" })

vim.keymap.set("i", "<C-k>", function()
    require("blink.cmp").show_signature()
end, { desc = "blink.cmp: show signature help" })

-- Todo-comments
vim.keymap.set("n", "<leader>tn", function()
    require("todo-comments").jump_next()
end, { desc = "todo-comments: next todo comment" })

vim.keymap.set("n", "<leader>tp", function()
    require("todo-comments").jump_prev()
end, { desc = "todo-comments: previous todo comment" })

vim.keymap.set("n", "<leader>tk", function()
    require("todo-comments").jump_next({
        keywords = { "ERROR", "WARNING" },
    })
end, { desc = "todo-comments: next error/warning comment" })

vim.keymap.set("n", "<leader>tj", function()
    require("todo-comments").jump_prev({
        keywords = { "ERROR", "WARNING" },
    })
end, { desc = "todo-comments: previous error/warning comment" })

vim.keymap.set("n", "<leader>tt", function()
    vim.cmd("TodoTelescope")
end, { desc = "todo-comments: open todos in telescope" })

-- Which-key
vim.keymap.set("n", "<leader>wk", function()
    require("which-key").show()
end, { desc = "which-key: show global keymaps" })

vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "which-key: show buffer local keymaps" })

-- Conform
vim.keymap.set("n", "<leader>fm", function()
    require("conform").format({
        async = true,
    })
end, { desc = "conform: format buffer" })

