local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
local status2, util = pcall(require, 'lspconfig/util')
if (not status2) then return end

local protocol = require('vim.lsp.protocol')
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
    end
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    init_options = {
        hostInfo = "neovim"
    }
}

nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    },
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
}


nvim_lsp.gopls.setup {
    on_attach = on_attach,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

nvim_lsp.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'typescript', 'javascript', 'css', 'sass',
        'scss', 'less' },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
})

nvim_lsp.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'css', 'sass', 'scss', 'less' },
    root_dir = util.root_pattern("package.json", ".git"),
    cmd = { "vscode-css-language-server", "--stdio" },
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    },
    single_file_support = true,
})


nvim_lsp.cssmodules_ls.setup {
    -- provide your on_attach to bind keymappings
    on_attach = on_attach,
    cmd = { "cssmodules-language-server" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = util.root_pattern("package.json"),
    -- optionally
    init_options = {
        camelCase = 'dashes',
    },
}


nvim_lsp.tailwindcss.setup {}

nvim_lsp.anakin_language_server.setup {}
