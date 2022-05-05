local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local disable_for = {
    "volar",
    "tsserver",
}

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(clients)
            return vim.tbl_filter(
                function(client)
                    return not vim.tbl_contains(disable_for, client.name)
                end,
                clients
            )
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

null_ls.setup({
    sources = {
        code_actions.eslint_d,
        diagnostics.eslint_d,
        formatting.eslint_d,

        formatting.sqlformat,

        diagnostics.pylama.with({
            -- NOTE: for some reason pylama wants to start at the repository root?
            -- this means it'll miss a pylama.ini in a nested directory
            -- e.g. project/python/pylama.ini
            cwd = vim.loop.cwd,
        }),
        formatting.black.with({
            cwd = vim.loop.cwd,
        }),
        formatting.isort.with({
            cwd = vim.loop.cwd,
        }),
    },
    on_attach = on_attach,
})
