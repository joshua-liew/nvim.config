require('tree-sitter-manager').setup({
    -- A list of parser names, or "all"
    ensure_installed = { "javascript", "typescript", "c", "go", "rust", "python", "zig", },

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    noauto_install = { "gitcommit", },
    highlight = true
})

