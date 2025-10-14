-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Disable arrow keys
-- vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
-- vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
-- vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
-- vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "<Alt>-z", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Alt>-x", "<i>", { noremap = false })
vim.api.nvim_set_keymap("i", "<Alt>-c", "<visual mode?>", { noremap = false })
