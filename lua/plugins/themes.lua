return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			transparent_background = true,
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin-macchiato") -- ✅ was missing entirely
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
	-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
	-- 		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
	-- 		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
	-- 	end,
	-- },
	{
		"scottmckendry/cyberdream.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				terminal_colors = true,
				hide_fillchars = false,
				theme = {
					dark = {
						bg = "#000000", -- ✅ black background
						fg = "#c0caf5",
						keyword = "#7aa2f7",
						func = "#9ece6a",
						type = "#2ac3de",
						string = "#e0af68",
						comment = "#565f89",
					},
				},
			})
			vim.cmd.colorscheme("cyberdream")

			-- ✅ Force black background even when transparency is on
			vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
		end,
	},
}
