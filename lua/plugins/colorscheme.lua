-- colorscheme
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal",   { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" , fg = nil})
  end,
})
vim.cmd.colorscheme(vim.g.colors_name or "default")

