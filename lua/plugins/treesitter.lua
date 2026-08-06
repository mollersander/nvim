return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "rust",
        "elixir",
        "eex",
        "heex",
        "yaml",
        "c",
        "dot",
        "dockerfile",
        "editorconfig",
        "html",
        "toml",
        "tmux",
        "ssh_config",
        "sql",
        "regex",
        "nginx",
        "markdown",
        "make",
        "lua",
        "json",
        "csv"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })

    -- Auto-update parsers
    vim.defer_fn(function() pcall(vim.cmd, "TSUpdate") end, 0)
  end,
}
