return {
	{
		"mason-org/mason.nvim",
		config = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- C / C++
					"clangd",

					-- Java
					"jdtls",
					-- "vscode-spring-boot-tools",

					-- Lua
					"lua_ls",

					-- Python
					"pyright",
					"pylsp",
					-- "black",

					-- Rust
					-- "rust_analyzer",

					-- Shell / Bash
					-- "shfmt",

					-- Lua Formatter
					"stylua",
				},
				automatic_installation = true,
			})
		end,
	},
}
--   {
--     "jay-babu/mason-null-ls.nvim",
--     dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
--     config = function()
--       require("mason-null-ls").setup({
--         ensure_installed = {
--           "prettier",
--         },
--         automatic_installation = true,
--       })
--     end,
--   }
-- }
