return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					buffer_previewer_maker = function(filepath, bufnr, opts)
						opts = opts or {}
						filepath = vim.fn.expand(filepath)
						vim.loop.fs_stat(filepath, function(_, stat)
							if not stat then
								return
							end
							if stat.size > 100000 then
								return
							else
								require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
							end
						end)
					end,
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
			local diagnostics = null_ls.builtins.diagnostics

			require("mason-null-ls").setup({
				ensure_installed = {
					"checkmake",
					"prettier",
					"eslint_d",
					"shfmt",
				},
				automatic_installation = true,
			})

			local sources = {
				diagnostics.checkmake,
				formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
				formatting.stylua,
				formatting.shfmt.with({ args = { "-i", "4" } }),
				formatting.terraform_fmt,
				require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
				require("none-ls.formatting.ruff_format"),
			}

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = sources,
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
