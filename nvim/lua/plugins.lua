local status, packer = pcall(require, 'packer')

if (not status) then
  print("Packer is not installed")
  return
end


vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- it seft
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } -- Statusline
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'onsails/lspkind.nvim' -- vscode-like picotgrams
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Syntax highlight
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- LSP
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for neovim's buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  }) -- lspsaga LSP UIs
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics , code actions, and more
  use 'MunifTanjim/prettier.nvim' -- Prettierplugin for neovim's built-in LSP client
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"


  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  } -- Fuzzy find
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- Using packer.nvim
  use { 'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  } -- Tabline
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  } -- git blame
  use 'dinhhuy258/git.nvim'


  -- Tienes's addition
  use "kylechui/nvim-surround"
  -- Tree files
  use 'nvim-tree/nvim-tree.lua'

  -- Theme
  use 'folke/tokyonight.nvim'


end)
