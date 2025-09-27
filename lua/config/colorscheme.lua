-- colorscheme
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_bold = true
vim.g.nord_italic = true

vim.cmd.colorscheme("nord")
vim.cmd(":hi statusline guibg=none")
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#5e81ac", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = true })

-- Override background to follow terminal style
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })

