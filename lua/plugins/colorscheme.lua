return {
	"scottmckendry/cyberdream.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			terminal_colors = true,
			hide_fillchars = false, -- show borders if needed
			theme = {
				dark = {
					bg = "#0f1117", -- Darker fallback for transparency
					fg = "#c0caf5", -- Light text for contrast
					keyword = "#7aa2f7", -- Keywords (like `return`, `if`)
					func = "#9ece6a", -- Functions
					type = "#2ac3de", -- Types like List<Integer>
					string = "#e0af68",
					comment = "#565f89", -- Italic comments
				},
			},
		})
		vim.cmd.colorscheme("cyberdream")
	end,
}

-- return {
-- 	{
-- 		"LazyVim/LazyVim",
-- 		opts = function()
-- 			-- set colorscheme
-- 			vim.cmd.colorscheme("habamax")
--
-- 			-- make background transparent
-- 			vim.cmd([[
--         highlight Normal guibg=NONE ctermbg=NONE
--         highlight NormalNC guibg=NONE ctermbg=NONE
--         highlight SignColumn guibg=NONE ctermbg=NONE
--         highlight EndOfBuffer guibg=NONE ctermbg=NONE
--       ]])
-- 		end,
-- 	},
-- }
