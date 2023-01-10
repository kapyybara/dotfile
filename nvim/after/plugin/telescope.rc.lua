local status, telescope = pcall(require, 'telescope')

if (not status) then return end

local actions = require('telescope.actions')

function Telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  --pickers = {
  --  find_files = {
  --    theme = "dropdown",
  --  },
  --  live_grep = {
  --    theme = "dropdown",
  --  },
  --},
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd("startinsert")
          end,
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', ';f',
  '<cmd>lua require("telescope.builtin").find_files({winblend = 5, no_ignore = false, hidden = true, })<cr>',
  opts)

vim.keymap.set('n', ';r', '<cmd>lua require("telescope.builtin").live_grep({winblend = 5})<cr>',
  opts)

vim.keymap.set('n', '\\\\', '<cmd>lua require("telescope.builtin").buffers({winblend = 5})<cr>',
  opts)

vim.keymap.set('n', ';t', '<cmd>lua require("telescope.builtin").help_tags({winblend = 5})<cr>',
  opts)

vim.keymap.set('n', ';;', '<cmd>lua require("telescope.builtin").resume({winblend = 5})<cr>',
  opts)

vim.keymap.set('n', ';e', '<cmd>lua require("telescope.builtin").diagnostics({winblend = 5})<cr>',
  opts)

vim.keymap.set('n', 'sf',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = Telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, initial_mode = "normal", layout_config = { height = 40 }})<cr>'
  ,
  opts)
