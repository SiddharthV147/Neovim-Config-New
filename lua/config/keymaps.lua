-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>n", ":Ex<CR>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-s>", ":w<CR>") -- Normal mode
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>") -- Insert mode
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>") -- Visual mode
vim.keymap.set("c", "<C-s>", "<C-c>:w<CR>")

-- Yank to system clipboard (like Ctrl+C in browser)
vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "yy", '"+yy', { noremap = true, silent = true })

-- Paste from system clipboard (like Ctrl+V in browser)
vim.keymap.set({ "n", "v" }, "p", '"+p', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "P", '"+P', { noremap = true, silent = true })

-- vim.keymap.set("", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<C-l>", ":Yazi<CR>", { silent = true, desc = "Open Yazi" })

vim.keymap.set("n", "<leader>a", "ggVG")
