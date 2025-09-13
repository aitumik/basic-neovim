local opts = { noremap = true,slient = true}

vim.g.mapleader = " " 
vim.g.maplocalleader = " " 

--vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
--vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
--vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
--vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})

vim.keymap.set("v","K",":m '<-2<CR>gv=gv",{ desc = "moves lines up in the visual selection"})
vim.keymap.set("v","J",":m '>+1<CR>gv=gv",{ desc = "moves lines down in the visual selection"})

vim.keymap.set("n","<C-d>","<C-d>zz",{ desc = "move down in buffer with cursor centered"})
vim.keymap.set("n","<C-u>","<C-u>zz",{ desc = "move up in buffer with cursor centered"})
