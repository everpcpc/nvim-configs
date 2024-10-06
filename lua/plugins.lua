return require("packer").startup(function()
  use "wbthomason/packer.nvim"

  -- use 'glepnir/zephyr-nvim'
  use "folke/tokyonight.nvim"
  -- use "projekt0n/github-nvim-theme"
  use "kyazdani42/nvim-web-devicons"

  use "ntpeters/vim-better-whitespace"

  use "kyazdani42/nvim-tree.lua"

  use "akinsho/bufferline.nvim"

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }

  use "wakatime/vim-wakatime"

  use "yamatsum/nvim-cursorline"

  use "terrortylor/nvim-comment"

  -- nvim-cmp
  use "hrsh7th/cmp-nvim-lsp" -- { name = nvim_lsp }
  use "hrsh7th/cmp-buffer" -- { name = 'buffer' },
  use "hrsh7th/cmp-path" -- { name = 'path' }
  use "hrsh7th/cmp-cmdline" -- { name = 'cmdline' }
  use "hrsh7th/nvim-cmp"
  -- vsnip
  use "hrsh7th/cmp-vsnip" -- { name = 'vsnip' }
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"
  -- lspkind
  use "onsails/lspkind-nvim"

  use "neovim/nvim-lspconfig"
  use "ray-x/lsp_signature.nvim"
  use "lukas-reineke/lsp-format.nvim"
end)
