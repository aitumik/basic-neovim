local opts = { noremap = true,silent = true}

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

vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")

-- should be able to use a dot here to repeat last command, not working now
vim.keymap.set("v","<","<gv",opts)
vim.keymap.set("v",">",">gv",opts)

-- paste without replacing clipboard content
vim.keymap.set("x","<leader>p",[["_dP]])

vim.keymap.set("v","p",'"_dp',opts)

vim.keymap.set({ "n", "v" },"<leader>d",[["_d]])

-- Dangling highlights are cleared
vim.keymap.set("n","<C-c>",":nohls<CR>",{desc = "clears search highlights"})
