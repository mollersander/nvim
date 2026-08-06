return {
  "HuntFeng/filebuf.nvim",
  -- not lazy-loaded: hijack_netrw has to be in place before the first `:e <dir>`
  lazy = false,
  keys = {
    { "-", "<CMD>Filebuf<CR>", desc = "Open filesystem tree in Filebuf" },
  },
  config = function()
    require("filebuf").setup({
      show_hidden = true, -- show dotfiles
      hijack_netrw = true,
      git_status = true,
      auto_focus_current_file = true,
      save_confirmation = true,
      permanent_delete = false, -- deletions go to /tmp/filebuf_trash
      sort_method = "type",
    })

    -- filebuf sets its fold options with `vim.wo` and never restores them, so a
    -- file opened into the same window keeps foldmethod=expr + foldlevel=0 and
    -- comes up fully folded (the ftplugin-provided treesitter foldexpr then
    -- actually fires). Put the window back to Neovim's defaults on the way out.
    local fold_defaults = {
      foldmethod = "manual",
      foldexpr = "0",
      foldtext = "foldtext()",
      foldcolumn = "0",
      foldlevel = 0,
      foldenable = true,
    }

    vim.api.nvim_create_autocmd("BufWinLeave", {
      group = vim.api.nvim_create_augroup("filebuf_restore_folds", { clear = true }),
      desc = "Restore fold options filebuf leaks into the window",
      callback = function(args)
        if vim.bo[args.buf].filetype ~= "filebuf" then
          return
        end
        local win = vim.api.nvim_get_current_win()
        if vim.api.nvim_win_get_buf(win) ~= args.buf then
          return
        end
        for opt, value in pairs(fold_defaults) do
          vim.wo[win][opt] = value
        end
      end,
    })
  end,
}
