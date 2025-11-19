# AGENTS.md - Neovim Configuration Guidelines

## Build/Test Commands
- **No formal build process**: This is a Neovim configuration, not a compiled project
- **Test configuration**: `:source %` to reload current file or `:source $MYVIMRC` to reload entire config
- **Validate Lua syntax**: Use `lua -c <filename>` for syntax checking
- **Check Neovim compatibility**: Requires Neovim >= 0.12

## Code Style Guidelines

### File Structure
- Core configuration in `lua/core/` (options, keymaps, plugins, autocmd)
- Plugin configurations in `lua/plugins/` (one file per plugin/feature)
- Entry point is `init.lua` with modular require statements

### Lua Conventions
- Use double quotes for strings: `"string"`
- 2-space indentation (vim.o.shiftwidth = 2)
- Local variables: `local map = vim.keymap.set`
- Comments: `-- Comment style`
- Table alignment for readability

### Naming Conventions
- Files: lowercase with dots (e.g., `telescope.lua`)
- Variables: snake_case (e.g., `local caps = require("cmp_nvim_lsp").default_capabilities()`)
- Functions: snake_case following Lua conventions

### Plugin Management
- Use vim.pack.add() with full GitHub URLs
- Group related plugins with comments
- Include description comments for plugin purposes

### Error Handling
- Minimal error handling - let Neovim handle plugin errors naturally
- Use pcall() for optional requires when needed