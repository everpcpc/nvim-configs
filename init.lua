require "basic"
require "plugins"
require "keybindings"

-- theme
-- require('plugin-config/github-theme')
-- require('zephyr')
vim.cmd [[colorscheme tokyonight]]

-- plugins
require "plugin-config/tree"
require "plugin-config/treesitter"
require "plugin-config/bufferline"
require "plugin-config/cursorline"
require "plugin-config/cmp"
require "plugin-config/lsp"
