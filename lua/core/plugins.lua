-- Docs: :help pack
vim.pack.add({
  -- Dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- Core plugins
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/stevearc/oil.nvim" },

  -- Appearance
  { src = "https://github.com/sainnhe/gruvbox-material" },
  { src = "https://github.com/goolord/alpha-nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },

  -- LSP + completion
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },

  -- Code convenience
  { src = "https://github.com/numToStr/Comment.nvim" },
  { src = "https://github.com/pocco81/auto-save.nvim" },
  { src = "https://github.com/mbbill/undotree" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/karb94/neoscroll.nvim" },

  -- Git
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },

  -- Diagnostics
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },

  -- Mason stack, autoinstall lsp
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },

  -- Mason stack, autoinstall lsp
  { src = "https://github.com/amitds1997/remote-nvim.nvim" },

  -- AI
  { src = "https://github.com/NickvanDyke/opencode.nvim" },

  { src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
  { src = "https://github.com/zbirenbaum/copilot-cmp" },
  { src = "https://github.com/zbirenbaum/copilot.lua" },

}, { confirm = false })
