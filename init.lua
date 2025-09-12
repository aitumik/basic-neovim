-- Set colorscheme
vim.g.mapleader = " "

vim.cmd('set termguicolors')
vim.cmd('colorscheme retrobox')

-- Telescope setup
require('telescope').setup{}

-- Keymaps for Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})

vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

