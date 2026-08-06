-- Elixir uses 2-space indentation (matches `mix format`)
vim.api.nvim_create_autocmd("FileType", {
  desc = "Elixir indentation",
  group = vim.api.nvim_create_augroup("elixir-indent", { clear = true }),
  pattern = { "elixir", "eelixir", "heex", "surface" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
