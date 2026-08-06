# AGENTS.md

Guidance for coding agents working in this repository.

## Overview

Personal Neovim configuration, Neovim >= 0.12, lazy.nvim as plugin manager.

This directory is a **git submodule** of a dotfiles repo (`.git` is a gitdir pointer file, not a
directory), and `~/.config/nvim` is a symlink to it. Editing files here edits the live config — a bad
change breaks the next `nvim` launch, so validate before finishing.

## Validating Changes

There is no build or test suite. Validate by loading the config:

- Syntax-check one file without side effects: `nvim --headless -c "luafile <file>" -c "qa"`
- Full smoke test (catches spec errors and plugin load failures): `nvim --headless -c "qa"` — silent on
  success, prints errors otherwise
- In a running session: `:source %` (bound to `<leader>o`), `:source $MYVIMRC`, or `:checkhealth`
- After changing a plugin spec, run `:Lazy sync`; `lazy-lock.json` is committed, so include it in the change

## Architecture

- `init.lua` — bootstraps lazy.nvim, requires `core.options` → `core.keymaps` → `core.autocmd`, then
  `{ import = "plugins" }` picks up every file in `lua/plugins/`. Adding a plugin means adding a file;
  there is no central registry to update. `checker.enabled = false` — no automatic update checks.
- `lua/core/` — loaded *before* plugins, so anything set here (notably `mapleader = " "`) is available
  when plugin specs are evaluated.
- `lua/plugins/` — one file per plugin/feature, each returning a lazy.nvim spec table (or array of specs).

### Where keymaps come from

Three places; pick by lifetime:

1. `lua/core/keymaps.lua` — global, always loaded, plugin-independent.
2. A plugin spec's `keys = {}` — this *is* the lazy-load trigger. Use it when pressing the key should be
   what loads the plugin (telescope, oil, diffview, sidekick).
3. The `LspAttach` autocmd in `lua/plugins/lsp.lua` — buffer-local, only where an LSP attached
   (`gd`, `gD`, `gi`, `gl`, `<leader>rn`, `<leader>ca`, `<leader>f`).

### LSP

`lua/plugins/lsp.lua` uses the Neovim 0.11+ `vim.lsp.config()` / `vim.lsp.enable()` API, **not**
`require("lspconfig").<server>.setup{}`. Don't mix the two styles.

- `vim.lsp.config("*", { capabilities = ... })` applies nvim-cmp capabilities to every client once.
- Per-server settings go through `vim.lsp.config("<name>", {...})` followed by `vim.lsp.enable("<name>")`.
  Both calls are required — config alone starts nothing.
- Servers are installed by mason. `mason-lspconfig`'s `ensure_installed` covers only some of the enabled
  servers, so newly enabled ones may need a `:Mason` install as well.

### Diagnostics

`lua/plugins/diagnostics.lua` disables *all* built-in diagnostic display (`virtual_text`, `virtual_lines`,
`signs` = false) and hands rendering to `tiny-inline-diagnostic`. Re-enabling any of those in a
`vim.diagnostic.config()` call elsewhere produces doubled messages.

### Completion

nvim-cmp with `nvim_lsp` / `path` / `buffer` sources. Its `menu_opened`/`menu_closed` handlers set
`vim.b.copilot_suggestion_hidden` to suppress Copilot ghost text — but both plugins in
`lua/plugins/copilot.lua` are `enabled = false`, so that is currently dormant wiring.

### AI tooling

`lua/plugins/sidekick.lua` is the AI integration (opencode + claude CLIs) under the `<leader>a*` prefix.
It launches CLIs in a **tmux** vertical split (`cli.mux.backend = "tmux"`), so behavior differs outside
tmux. `cli.watch = true` reloads buffers the CLI modifies on disk.

### Colorscheme

gruvbox-material, `lazy = false, priority = 1000`. A `ColorScheme` autocmd clears `Normal`/`NormalNC`
backgrounds for terminal transparency — colorscheme changes must preserve that hook or transparency is lost.

## Conventions

### Lua style

Double quotes, 2-space indent, snake_case for variables and functions, `-- ` comments with a space after
the dashes. No space before call parentheses. Align table entries where it aids readability. Plugin files
are lowercase, one per plugin/feature (`telescope.lua`, `diagnostics.lua`).

### Plugin specs

- `opts = {}` for plain config; `config = function()` calling `require("<plugin>").setup({...})` when
  setup logic is needed.
- For plugins with no `setup()`, set globals from `init`.
- Declare deps with `dependencies = { ... }`; multi-plugin files return an array of specs.
- Lazy-loading triggers:
  - `lazy = false, priority = 1000` — colorschemes
  - `event = "VeryLazy"` — non-critical UI
  - `event = { "BufReadPost", "BufNewFile" }` (or `BufReadPre`) — buffer plugins
  - `event = "InsertEnter"` — completion/insert-mode plugins
  - `cmd = "CommandName"` — command-triggered plugins
  - `keys = { ... }` — keymap-triggered plugins

### Keymaps

Leader is `<space>` (set in `lua/core/options.lua`). Always include `desc`. Use `{ "n", "x" }` for
normal + visual. Group by prefix: `<leader>a*` AI/sidekick, `<leader>d*` diffview, `<leader>f*` telescope.

### Error handling

Minimal — let Neovim surface plugin errors naturally. `pcall()` only for genuinely optional requires.
No try/catch wrapping around plugin config.

## Gotchas

- `lua/core/options.lua` sets `tabstop`/`softtabstop` to 4 but `shiftwidth` to 2. Config files here use
  2-space indent; `lua/core/autocmd.lua` forces 2 across the board for Elixir/EEx/HEEx/Surface filetypes.
- `swapfile`, `backup`, and `writebackup` are all off; `undofile` is on, writing to `~/.vim/undodir`.
- auto-save is enabled (`InsertLeave`, `TextChanged`), so edits hit disk almost immediately while a
  session is open.
- `.gitignore` contains only `.git`, so stray artifacts (e.g. `erl_crash.dump`) show up as untracked.
