vim.g.mapleader = " "

-- font
vim.g.have_nerd_font = true

-- mouse
vim.cmd([[set mouse=]])

-- indenting
vim.o.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- visual
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
-- vim.o.winborder = "rounded"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.o.wrap = false

-- cursor
vim.o.cursorline = true
vim.o.cursorcolumn = false

-- editing
vim.o.autowrite = false
vim.opt.autoread = true

-- backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- undo
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.opt.smartcase = true

-- buffer
vim.opt.updatetime = 50

-- Set borders between splits
vim.opt.fillchars:append({ vert = "┃", horiz = "━", horizup = "┻", horizdown = "┳", vertleft = "┨", vertright = "┣", verthoriz ="╋" })

-- Always show window separators
vim.opt.splitright = true
vim.opt.splitbelow = true
