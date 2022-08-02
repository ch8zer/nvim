local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugins.lsp.config"
-- require("user.lsp.handlers").setup()
require "plugins.lsp.null-ls"
