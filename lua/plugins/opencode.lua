-- OpenCode integration for Neovim
-- Configuration via vim.g.opencode_opts (no setup() function exists)
---@type opencode.Opts
vim.g.opencode_opts = {
  -- Your configuration can go here if needed
  -- See lua/opencode/config.lua for available options
}

-- Required for auto_reload functionality
vim.o.autoread = true

-- Custom keymaps following the recommended patterns from the README
local map = vim.keymap.set

-- Ask opencode with @this context (recommended binding)
map({ "n", "x" }, "<leader>oa", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode about selection/line" })

-- Execute opencode action menu (recommended binding)
map({ "n", "x" }, "<leader>ox", function()
  require("opencode").select()
end, { desc = "Execute opencode action…" })

-- Add to opencode prompt
map({ "n", "x" }, "<leader>op", function()
  require("opencode").prompt("@this")
end, { desc = "Add selection/line to opencode" })

-- Additional useful prompts using built-in prompt names
map({ "n", "x" }, "<leader>oe", function()
  require("opencode").prompt("explain")
end, { desc = "Explain code with opencode" })

map({ "n", "x" }, "<leader>or", function()
  require("opencode").prompt("review")
end, { desc = "Review code with opencode" })

map({ "n", "x" }, "<leader>of", function()
  require("opencode").prompt("fix")
end, { desc = "Fix diagnostics with opencode" })

map({ "n", "x" }, "<leader>oo", function()
  require("opencode").prompt("optimize")
end, { desc = "Optimize code with opencode" })
