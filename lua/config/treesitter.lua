require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python",
    "rust",
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
}

-- Always get latest parsers
vim.defer_fn(function() pcall(vim.cmd, "TSUpdate") end, 0)
