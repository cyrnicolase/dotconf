local util_status_ok, util = pcall(require, "lspconfig/util")
if not util_status_ok then
  return
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

local opts = {
  cmd = {'gopls', 'serve'},
  filetypes = {'go', 'gomod'},
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}

return {
  on_setup = function(server)
    server.setup(opts)
  end
}
