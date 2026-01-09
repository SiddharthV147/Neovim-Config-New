-- Format on save and linters
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		------------------------------------------------------------
		-- Global ignore directories (envs, deps, build artifacts)
		------------------------------------------------------------
		local ignore_dirs = {
			"node_modules",
			".node_modules",
			"venv",
			".venv",
			"pyvenv",
			".pyenv",
			"__pycache__",
			"dist",
			"build",
			"out",
			"target", -- Rust / JVM
			".cargo",
			".mypy_cache",
			".pytest_cache",
			".ruff_cache",
			".gradle",
			".idea",
			".vscode",
			".classpath",
			".settings",
			".project",
		}

		------------------------------------------------------------
		-- Telescope (ignore dirs in live_grep)
		------------------------------------------------------------
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ps", function()
			builtin.live_grep({
				cwd = vim.loop.cwd(),
				additional_args = function()
					local args = {}
					for _, dir in ipairs(ignore_dirs) do
						table.insert(args, "--glob=!" .. dir .. "/**")
					end
					return args
				end,
			})
		end, { desc = "Telescope live grep (ignore env/build dirs)" })

		------------------------------------------------------------
		-- null-ls / none-ls setup
		------------------------------------------------------------
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

		------------------------------------------------------------
		-- Helper: convert ignore dirs to CLI args
		------------------------------------------------------------
		local function ignore_args(prefix)
			local args = {}
			for _, dir in ipairs(ignore_dirs) do
				table.insert(args, prefix .. dir)
			end
			return args
		end

		local sources = {
			--------------------------------------------------------
			-- Make
			--------------------------------------------------------
			diagnostics.checkmake,

			--------------------------------------------------------
			-- JS / TS / Web
			--------------------------------------------------------
			formatting.prettier.with({
				filetypes = { "html", "json", "yaml", "markdown" },
				extra_args = ignore_args("--ignore-path "),
			}),

			--------------------------------------------------------
			-- Lua
			--------------------------------------------------------
			formatting.stylua,

			--------------------------------------------------------
			-- Shell
			--------------------------------------------------------
			formatting.shfmt.with({
				args = { "-i", "4" },
			}),

			--------------------------------------------------------
			-- Terraform
			--------------------------------------------------------
			formatting.terraform_fmt,

			--------------------------------------------------------
			-- Python (Ruff)
			--------------------------------------------------------
			require("none-ls.formatting.ruff").with({
				extra_args = vim.list_extend({ "--extend-select", "I" }, ignore_args("--exclude ")),
			}),

			require("none-ls.formatting.ruff_format").with({
				extra_args = ignore_args("--exclude "),
			}),
		}

		------------------------------------------------------------
		-- Format on save (safe & filtered)
		------------------------------------------------------------
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
							vim.lsp.buf.format({
								async = false,
								filter = function(c)
									return c.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
