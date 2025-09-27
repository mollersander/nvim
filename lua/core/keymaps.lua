local map = vim.keymap.set

map('n', '<C-f>', ':Open .<CR>')

-- config shortcuts
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/.config/zsh/.zshrc<CR>')

-- system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>d', '"+d')

-- word correction
map({ 'n', 'v' }, '<leader>c', '1z=')

-- Lua
map({ 'n', 'v' }, '<leader>o', ':update<CR> :source<CR>')

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle while jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Splitting & Resizing
map("n", '<leader>%', ":vsplit<CR>", { desc = "Split window vertically" })
map("n", '<leader>"', ":split<CR>", { desc = "Split window horizontally" })
-- map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
-- map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

