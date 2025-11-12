local sig = require "lsp_signature"
local format = require "lsp-format"

sig.setup {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded",
  },
  hint_prefix = "🍈 ",
  shadow_guibg = "Green",
}
format.setup {
  yaml = {
    tab_width = 2,
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach()
  require("lsp-format").on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Configure LSP servers using the new vim.lsp.config API (Neovim 0.11+)
local servers = { "pyright", "rust_analyzer", "gopls" }

for _, lsp in pairs(servers) do
  vim.lsp.config[lsp] = {
    cmd = { lsp },
    root_markers = { '.git' },
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
  vim.lsp.enable(lsp)
end

-- Configure yamlls
vim.lsp.config.yamlls = {
  cmd = { 'yamlls' },
  root_markers = { '.git' },
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      hover = true,
      validate = true,
      completion = true,
    },
  }
}
vim.lsp.enable('yamlls')

-- Configure efm
local gen_fmt = function(cmds)
  cfg = {}
  for _, cmd in pairs(cmds) do
    table.insert(cfg, {
      formatCommand = cmd,
      formatStdin = true,
    })
  end
  return cfg
end

vim.lsp.config.efm = {
  cmd = { 'efm-langserver' },
  root_markers = { '.git' },
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      python = gen_fmt { "black --fast -" },
      go = gen_fmt { "goimports" },
      lua = gen_fmt { "stylua -s --stdin-filepath ${INPUT} -" },
    },
  },
}
vim.lsp.enable('efm')
