local status, tree = pcall(require, 'nvim-tree')

if (not status) then return end

local opts = { noremap = true, silent = true }

tree.setup(
    {
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                },
            },
            width = 20,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    }
)

vim.keymap.set('n', 'sf',
    '<cmd>NvimTreeToggle <cr>'
    ,
    opts)
