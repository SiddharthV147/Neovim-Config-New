return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					-- No slashes: matches these folder names anywhere in the path string
					file_ignore_patterns = {
						"node_modules",
						"%.git",
						"build",
						"venv",
						"%.venv",
						"env",
						"__pycache__",
					},
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"jayp0521/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting

			require("mason-null-ls").setup({
				ensure_installed = { "checkmake", "prettier", "eslint_d", "shfmt" },
				automatic_installation = true,
			})

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.checkmake,
					formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
					formatting.stylua,
					formatting.shfmt.with({ args = { "-i", "4" } }),
					formatting.terraform_fmt,
					require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
					require("none-ls.formatting.ruff_format"),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
}
