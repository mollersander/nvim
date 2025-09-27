
require("telescope").setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "smart" },
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
    },
    live_grep = {
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
