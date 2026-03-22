return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "List LSP references" },
  },
  config = function()
    local additional_rg_args = { "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }

    require("telescope").setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        layout_config = {
          horizontal = { preview_width = 0.55 },
          vertical = { mirror = false },
        },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
      },
      pickers = {
        find_files = {
          hidden = true, -- also show dotfiles
          follow = true, -- follow symlinks
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        live_grep = { additional_args = additional_rg_args },
        grep_string = { additional_args = additional_rg_args },
      },
    })
  end,
}
