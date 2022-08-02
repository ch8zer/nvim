-- add language servers here
-- If you want more settings, add them to the dir lsp/settings
local servers = {
    "bashls",
    "clangd",
    "dockerls",
    "eslint",
    "html",
    "pylsp",
    "rust_analyzer",
    "sumneko_lua",
    "vuels",
    "yamlls",
}

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, lspcmp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    print("cmp not found")
    return
end

-- add the language servers if possible
lsp_installer.setup({
    ensure_installed = servers,
})

-- want snippet functionalities
local capabilities = lspcmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
    local opts = {
        capabilities = capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    lspconfig[server].setup(opts)
end
