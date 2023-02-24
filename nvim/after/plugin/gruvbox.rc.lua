local status, theme = pcall(require, "gruvbox")
if (not status) then return end

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = false,
    italic = true,
    strikethrough = true,
    invert_selection = true,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
