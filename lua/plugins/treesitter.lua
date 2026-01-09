return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"python",
				"c",
				"cpp",
				"rust",
				"java",
				"html",
				"css",
				"bash",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
