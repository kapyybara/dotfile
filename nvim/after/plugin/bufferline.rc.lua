local status, bufferline = pcall(require, 'bufferline')
local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above

if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_buffer_icons = true,
    show_close_icon = false,
  },
  highlights = {
    separator = {
      fg = colors.bg_dark,
      bg = colors.bg_float,
    },
    separator_selected = {
      fg = colors.bg_dark,
    },
    background = {
      fg = '#657b83',
      bg = colors.bg_float
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = colors.bg_dark
    }
  },
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
