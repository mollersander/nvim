-- Fallback file manager. Replaced by lua/plugins/filebuf.lua — flip `enabled`
-- here and disable filebuf to switch back.
return {
  "stevearc/oil.nvim",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory in Oil" },
  },
  config = function()
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
  end,
}

