return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'glepnir/zephyr-nvim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use 'ray-x/go.nvim'

  use 'wakatime/vim-wakatime'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

end)
