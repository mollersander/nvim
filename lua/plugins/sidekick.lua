return {
  "folke/sidekick.nvim",
  opts = {
    -- Enable CLI with tmux support
    cli = {
      watch = true, -- Auto-reload files modified by AI tools
      mux = {
        backend = "tmux",
        enabled = true,
        create = "vsplit", -- Create sessions in tmux vertical split
      },
      -- Configure AI tools
      tools = {
        opencode = {},
        claude = {},
      },
    },
    -- Disable NES (Next Edit Suggestions) if you don't need Copilot integration
    nes = { enabled = false },
  },
  keys = {
    -- AI CLI management
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle() end,
      desc = "Toggle AI CLI",
    },
    {
      "<leader>ao",
      function() require("sidekick.cli").toggle({ name = "opencode", focus = true }) end,
      desc = "Toggle OpenCode",
    },
    {
      "<leader>ad",
      function() require("sidekick.cli").close() end,
      desc = "Close AI CLI",
    },
    {
      "<leader>af",
      function() require("sidekick.cli").focus() end,
      desc = "Focus AI CLI",
    },

    -- Send context to AI
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send this to AI",
    },
    {
      "<leader>aF",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      desc = "Send file to AI",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send selection to AI",
    },

    -- Prompts (matching your previous keymaps)
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Select AI prompt",
    },
    {
      "<leader>ae",
      function() require("sidekick.cli").send({ prompt = "explain" }) end,
      mode = { "n", "x" },
      desc = "Explain code",
    },
    {
      "<leader>ar",
      function() require("sidekick.cli").send({ prompt = "review" }) end,
      mode = { "n", "x" },
      desc = "Review code",
    },
    {
      "<leader>ax",
      function() require("sidekick.cli").send({ prompt = "fix" }) end,
      mode = { "n", "x" },
      desc = "Fix code",
    },
    {
      "<leader>aO",
      function() require("sidekick.cli").send({ prompt = "optimize" }) end,
      mode = { "n", "x" },
      desc = "Optimize code",
    },
    {
      "<leader>aD",
      function() require("sidekick.cli").send({ prompt = "document" }) end,
      mode = { "n", "x" },
      desc = "Document code",
    },
    {
      "<leader>aT",
      function() require("sidekick.cli").send({ prompt = "tests" }) end,
      mode = { "n", "x" },
      desc = "Write tests",
    },

    -- Terminal window control
    {
      "<c-.>",
      function() require("sidekick.cli").focus() end,
      desc = "Focus AI CLI",
      mode = { "n", "t", "i", "x" },
    },
  },
}
