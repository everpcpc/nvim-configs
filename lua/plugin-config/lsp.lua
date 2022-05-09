local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
  end,
}

lspconfig.pyright.setup {
}
