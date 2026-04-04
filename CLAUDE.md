@AGENTS.md
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Neovim configuration (requires Neovim >= 0.12) using lazy.nvim as the plugin manager.

## Validating Changes

- Reload current file: `:source %` or full config: `:source $MYVIMRC`
- Validate Lua syntax: `lua -c <filename>` or `nvim --headless -c "source <filename>" -c "quit"`
- Check plugin health: `:checkhealth`

## Architecture

- `init.lua` — bootstraps lazy.nvim, loads `lua/core/`, then imports all plugin specs from `lua/plugins/`
- `lua/core/` — options, keymaps, autocmds (loaded before plugins)
- `lua/plugins/` — one file per plugin, each returning a lazy.nvim spec table

## Conventions

**Lua style:** double quotes, 2-space indent, snake_case variables and functions, always include `desc` on keymaps.

**Plugin specs:** use `opts = {}` for simple config; use `config = function()` when setup logic is needed. For plugins without `setup()`, set globals via `init`. Multi-plugin files return an array of specs.

**Lazy-loading:**
- `lazy = false, priority = 1000` — colorschemes
- `event = "VeryLazy"` — non-critical UI
- `event = { "BufReadPost", "BufNewFile" }` — buffer plugins
- `event = "InsertEnter"` — completion/insert-mode plugins
- `keys = {...}` — keymap-triggered plugins

**Keymaps:** leader is `<space>`. Group by prefix (e.g. `<leader>a*` for AI/sidekick). Use `{ "n", "x" }` for normal + visual.
