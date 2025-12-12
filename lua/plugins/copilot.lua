require('copilot').setup({
  suggestion = {
    enabled = true,
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
  workspace_folders = {
    "/Users/sandermoller/Projects/gscan",
    "/home/salamander/dev",
  },
})
