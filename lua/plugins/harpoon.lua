-- lua/plugins/harpoon.lua
return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: add file" })
		vim.keymap.set("n", "<leader>r", mark.rm_file, { desc = "Harpoon: remove file" })
		vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, { desc = "Harpoon: menu" })

		for i = 1, 5 do
			vim.keymap.set("n", "<leader>" .. i, function()
				ui.nav_file(i)
			end, { desc = "Harpoon: go to file " .. i })
		end
	end,
}
