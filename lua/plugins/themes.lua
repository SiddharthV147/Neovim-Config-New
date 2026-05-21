return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false, -- ✅ was true, theme never loaded
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin-macchiato") -- ✅ was missing entirely
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
		end,
	},
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	priority = 999, -- ✅ lower than catppuccin so it doesn't win
	-- 	lazy = true, -- ✅ disabled since catppuccin is active
	-- 	config = function()
	-- 		require("cyberdream").setup({
	-- 			transparent = true,
	-- 			italic_comments = true,
	-- 			terminal_colors = true,
	-- 		})
	-- 	end,
	-- },
}
