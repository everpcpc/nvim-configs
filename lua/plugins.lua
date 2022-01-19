return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'glepnir/zephyr-nvim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use 'wakatime/vim-wakatime'

end)
