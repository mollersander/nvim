require('copilot_cmp').setup()

require('copilot').setup({
  suggestion = {
    enabled = false,
    auto_trigger = false,
    hide_during_completion = true,
    debounce = 75,
    trigger_on_accept = true,
    keymap = {
      accept = "<C-l>",
      -- accept_word = "<C-l>",
      -- accept_line = "<C-L>",
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-h>",
    },
  },
  panel = { enabled = false },
  copilot_model = "",
  workspace_folders = {
    "/Users/sandermoller/Projects/gscan",
    "/home/salamander/dev",
  },
})
