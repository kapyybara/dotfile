local status, saga = pcall(require, 'lspsaga')

if (not status) then return end

saga.setup {
  border_style = "rounded",
  code_action_icon = "",
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = false,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
  },
  server_filetype_map = {
  }

}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'gac', '<Cmd>Lspsaga code_action<cr>', opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts)
--vim.keymap.set("n", "<A-g>", "<cmd>Lspsaga open_floaterm lazygit<CR>", opts)
vim.keymap.set("t", "<A-q>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)
