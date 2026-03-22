# AGENTS.md - Neovim Configuration Guidelines

## Build/Test Commands
- **No formal build process**: This is a Neovim configuration, not a compiled project
- **Test configuration**: `:source %` to reload current file or `:source $MYVIMRC` to reload entire config
- **Validate Lua syntax**: `lua -c <filename>` or `nvim --headless -c "source <filename>" -c "quit"`
- **Check Neovim compatibility**: Requires Neovim >= 0.12
- **Health check**: `:checkhealth` to verify plugin installations

## Code Style Guidelines

### File Structure
- Core configuration in `lua/core/` (options, keymaps, autocmd)
- Plugin configurations in `lua/plugins/` (one file per plugin/feature)
- Entry point is `init.lua` which bootstraps lazy.nvim and loads core config
- Each plugin config file returns a lazy.nvim plugin spec table

### Lua Conventions
- Use double quotes for strings: `"string"`
- 2-space indentation (vim.o.shiftwidth = 2)
- Local variables: `local map = vim.keymap.set`
- Comments: `-- Comment style` with space after `--`
- Table alignment for readability
- Function calls: No space before parentheses `function()`

### Naming Conventions
- Files: lowercase with dots (e.g., `telescope.lua`, `opencode.lua`)
- Variables: snake_case (e.g., `local caps = require("cmp_nvim_lsp").default_capabilities()`)
- Functions: snake_case following Lua conventions
- Keymaps: Use descriptive `desc` field for all keymaps

### Plugin Management (lazy.nvim)
- Use lazy.nvim as the plugin manager (auto-bootstrapped in `init.lua`)
- Each plugin config file in `lua/plugins/` returns a lazy.nvim spec table
- Plugin spec format: `return { "owner/repo", opts = {...} }` or with `config` function
- Lazy-loading strategies:
  - `lazy = false, priority = 1000` for colorschemes
  - `event = "VeryLazy"` for non-critical UI plugins
  - `event = { "BufReadPost", "BufNewFile" }` for buffer-related plugins
  - `event = "InsertEnter"` for completion/insert-mode plugins
  - `cmd = "CommandName"` for command-triggered plugins
  - `keys = {...}` for keymap-triggered plugins
- For plugins without `setup()`: Use `init` function to set `vim.g.<plugin>_opts`
- For plugins with `setup()`: Use `config` function with `require("<plugin>").setup({...})`
- Dependencies declared with `dependencies = { "dep1", "dep2" }`
- Multi-plugin files return array: `return { {...}, {...} }`

### Keymap Conventions
- Leader key is `<space>` (configured in `lua/core/options.lua`)
- Use `{ "n", "x" }` for normal + visual mode keymaps
- Always include `desc` field for discoverability
- Group related keymaps by prefix (e.g., `<leader>o*` for opencode, `<leader>d*` for diffview)

### Error Handling
- Minimal error handling - let Neovim handle plugin errors naturally
- Use `pcall()` for optional requires when needed
- No try-catch wrapping around plugin configurations