local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
  return 
end

local mlsp_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

local nls_status_ok, null_ls = pcall(require, "null-ls")
if not nls_status_ok then
  vim.notify("null-ls not found!")
  return
end

local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
  vim.notify("lspconfig not found!")
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    }
  }
}

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "gopls",
  },
  automatic_installation = true,
}

null_ls.setup {}


local servers = {
  lua_ls = require("nicol.lsp.lua"),
  gopls = require("nicol.lsp.go"),
}


for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    config.on_setup(lspconfig[name])
  else
    lspconfig[name].setup({})
  end
end


