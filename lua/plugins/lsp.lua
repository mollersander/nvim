require("mason").setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require("mason-lspconfig").setup({
  ensure_installed = { "basedpyright" },
  automatic_installation = true,
})

-- Use nvim-cmp capabilities for ALL LSP clients
local caps = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config('*', { capabilities = caps }) -- applies globally

-- Optional: buffer-local extras on attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
  callback = function(args)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("gi", vim.lsp.buf.implementation, "Go to implementation")
    map("gl", vim.diagnostic.open_float, "Line diagnostics")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
  end,
})

vim.lsp.enable("basedpyright")
vim.lsp.enable('lua_ls')
vim.lsp.enable("ruff")
vim.lsp.enable("mypy")
