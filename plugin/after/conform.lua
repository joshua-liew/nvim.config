require('conform').setup({
    formatter_by_ft = {
        lua             = { "stylua", },
        python          = { "black", },
        rust            = { "rustfmt", },
        javascript      = { "prettierd", "prettier", stop_after_first = true },
        typescript      = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        css             = { "prettierd", "prettier", stop_after_first = true },
        html            = { "prettierd", "prettier", stop_after_first = true },
        json            = { "prettierd", "prettier", stop_after_first = true },
        yaml            = { "prettierd", "prettier", stop_after_first = true },
        markdown        = { "prettierd", "prettier", stop_after_first = true },
        c               = { "clang-format", },
        go              = { "goimports" },
        hcl             = { "hclfmt" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})
