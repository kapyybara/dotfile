local status, null_ls = pcall(require, 'null-ls')

if (not status) then return end

vim.cmd("autocmd BufWritePost * lua vim.lsp.buf.format({async = true})")

null_ls.setup {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({async = true})<CR>")

            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format({})")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end,
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})',
        }),
        null_ls.builtins.diagnostics.fish,
    },
}
