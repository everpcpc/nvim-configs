require('basic')
require('plugins')
require('keybindings')

-- theme
-- require('plugin-config/github-theme')
-- require('zephyr')
vim.cmd[[colorscheme tokyonight]]

-- plugins
require('plugin-config/nvim-tree')
require('plugin-config/nvim-treesitter')
require('plugin-config/bufferline')
require('plugin-config/cmp')
require('plugin-config/lsp')
require('plugin-config/lsp-signature')
