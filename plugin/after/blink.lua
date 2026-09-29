require("blink.cmp").setup({
    keymap = {
        -- Don't install Blink's default completion keybindings.
        -- This means Tab/Enter/etc. retain their normal Neovim behavior.
        preset = 'none',
    },

    completion = {
        menu = {
            -- Don't automatically open the completion menu while typing.
            -- Completion is therefore something you explicitly request
            -- with <C-space>.
            auto_show = false,
        },

        ghost_text = {
            -- Show the currently suggested completion as "ghost text"
            -- without actually inserting it into the buffer.
            enabled = true,
        },
    },

    sources = {
        -- Use these three sources when generating completion candidates:
        --
        -- lsp:
        --   Language-server-aware completions such as functions,
        --   variables, methods, types, APIs, etc.
        --
        -- path:
        --   Filesystem paths and directories.
        --
        -- buffer:
        --   Words/identifiers found in the current buffer(s).
        default = { 'lsp', 'path', 'buffer' },
    },

    signature = {
        -- Enable Blink's signature-help UI.
        enabled = true,

        trigger = {
            -- Allow signature help to appear automatically.
            enabled = true,

            -- Don't show signature help merely because we're typing
            -- ordinary keyword characters.
            show_on_keyword = false,

            -- Allow the language server's trigger characters (for example,
            -- "(" or ",") to automatically open/update signature help.
            show_on_trigger_character = true,
        },
    },
})

