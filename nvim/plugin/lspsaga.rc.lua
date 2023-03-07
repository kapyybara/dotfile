local status, saga = pcall(require, 'lspsaga')

if (not status) then return end

saga.setup {
    ui = {
        -- currently only round theme
        theme = 'dashed',
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
        expand = '',
        collapse = '',
        preview = ' ',
        code_action = '💡',
        diagnostic = '🐞',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal background color
            normal_bg = '#1e1e2e',
            --title background color
            title_bg = '#a6e3a1',
            red = '#f38ba8',
            magenta = '#f5e0dc',
            orange = '#eba0ac',
            yellow = '#f7bb3b',
            green = '#a6e3a1',
            cyan = '#36d0e0',
            blue = '#61afef',
            purple = '#cba6f7',
            white = '#d1d4cf',
            black = '#1e1e2e',
        },
        kind = {},
    },
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    symbol_in_winbar = {
        enable = true,
        separator = '  ',
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'gac', '<Cmd>Lspsaga code_action<cr>', opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)
vim.keymap.set("n", "<A-g>", "<cmd>Lspsaga term_toggle lazygit<CR>", opts)
--
vim.keymap.set("t", "<A-q>", [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], opts)

vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
