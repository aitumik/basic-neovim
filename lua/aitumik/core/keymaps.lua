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

-- both work but I am used to the first one
vim.keymap.set("n","<C-c>",":nohls<CR>",{desc = "clears search highlights",silent = true})
--vim.keymap.set("n","<C-c>",":nohl<CR>",{desc = "clears search highlights",silent = true})


-- Later for the LSP
--vim.keymap.set("n","<leader>f",vim.lsp.buf.format)

vim.keymap.set("n","x",'"_x',opts)

vim.keymap.set("n","<leader>s",[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- TODO : implement modern lua syntax here
--vim.keymap.set("n","<leader>s",function()
--    local word = vim.fn.expand("<cword>")
-- end,{desc = "Substiture word under the cursor"})


vim.api.nvim_create_autocmd("TextYankPost",{
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank",{ clear = true}),
    callback = function()
        local regname = vim.v.event.regname
        if regname == "" then regname = '"' end

        local yanked = vim.fn.getreg(regname,1,true)
        --print("yanked text : " .. table.concat(yanked,"\\n"))
        
        --print(string.format('event fired : %s',vim.inspect(vim.v.event)))
        vim.highlight.on_yank()
    end
})

--vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'},{
--    pattern = {'*.c','*.py'},
--    callback = function(ev)
--        print(string.format('event fired : %s',vim.inspect(ev)))
--    end
--})

-- lets do some splitting

vim.keymap.set("n","<leader>sv","<C-w>v",{desc = "Split window vertically"})
vim.keymap.set("n","<leader>sh","<C-w>s",{desc = "Split window horizontally"})
vim.keymap.set("n","<leader>se","<C-w>=",{desc = "Make splits equal size"})
vim.keymap.set("n","<leader>sx","<cmd>close<CR>",{desc = "Close current split"})

