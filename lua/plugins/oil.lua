require("oil").setup({
  default_file_explorer = true,
  keymaps = {
    ["q"] = "actions.close",
    ["<CR>"] = "actions.select",
    ["<BS>"] = "actions.parent",
    ["-"] = "actions.open_cwd",
    ["<leader>r"] = "actions.refresh",
  },
  view_options = {
    show_hidden = true, -- show dotfiles
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" })
