vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    require("nvchad.configs.lspconfig").on_attach(client, bufnr)
  end,
})

vim.lsp.enable("clangd")
