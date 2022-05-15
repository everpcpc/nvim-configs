-- leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true,
}

-- map("n", "<C-j>", "4j", opt)
-- map("n", "<C-k>", "4k", opt)
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

-- Go to home and end using capitalized directions
map("n", "H", "^", opt)
map("n", "L", "$", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制
map("n", "s.", ":vertical resize +20<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)

-- ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

--------------------------------------------------------------------
-- 插件快捷键
-- nvimTree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- bufferline 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-w>", ":bd<CR>", opt)

-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)

-- local pluginKeys = {}

-- -- nvim-cmp 自动补全

-- return pluginKeys
