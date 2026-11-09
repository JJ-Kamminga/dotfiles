vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'View project'})

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })

vim.keymap.set('n', 'gb', ':ls<CR>:b<space>', { noremap = true })

vim.keymap.set("n", "<leader>C", vim.cmd.Cheaty, { desc = 'View cheatsheet'})

vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<CR>', { desc = 'Save buffer' })

vim.keymap.set({'n', 'i', 'v'}, '<C-a>', '<Esc>:%y<CR>', { desc = 'Select all' })

vim.keymap.set("n", "<leader>b", "<cmd>Telescope projects<cr>", { desc = 'Browse projects' })
