-- colorscheme
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_matrial_enable_bold = true
vim.g.gruvbox_matrial_ui_contrast = "high"
vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")
-- vim.cmd(":hi statusline guibg=none")
-- vim.api.nvim_set_hl(0, "VertSplit", { fg = "#5e81ac", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = true })

-- Override background to follow terminal style
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })

