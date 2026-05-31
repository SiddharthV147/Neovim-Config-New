require "nvchad.mappings"

vim.keymap.set("n", "<leader><leader>", function()
	require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<C-p>", function()
	require("telescope.builtin").git_files()
end)
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").live_grep()
end)

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>T", function()
  require("nvchad.themes").open()
end, {})
