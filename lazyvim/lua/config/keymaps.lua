-- Keymaps are automatically loaded on the VeryLazy event

-- Delete default resizing keymaps
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")

-- Delete default moveline keymaps
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")

-- (Shift)tab to navigate between buffers
vim.keymap.set("n", "<tab>", ":bn<CR>")
vim.keymap.set("n", "<S-tab>", ":bp<CR>")

-- Faster scroll
vim.keymap.set("n", "<C-e>", "10<C-e>")
vim.keymap.set("n", "<C-y>", "10<C-y>")

-- -- Open file navigator
-- vim.keymap.set("n", "<C-n>", "<leader>ef")
