return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- "hrsh7th/nvim-cmp",
		"saghen/blink.cmp",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Mason setup
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "html", "cssls", "clangd" },
		})

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr }
			local map = vim.keymap.set

			map("n", "gd", vim.lsp.buf.definition, opts)
			map("n", "K", vim.lsp.buf.hover, opts)
			map("n", "<leader>rn", vim.lsp.buf.rename, opts)
			map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			map("n", "[d", vim.diagnostic.goto_prev, opts)
			map("n", "]d", vim.diagnostic.goto_next, opts)
			map("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end

		-- Capabilities for completion
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- List of servers
		local servers = { "lua_ls", "pyright", "rust_analyzer", "html", "cssls", "clangd" }

		for _, server in ipairs(servers) do
			-- Define server configuration in the new API
			vim.lsp.config[server] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			-- Start the LSP client
			vim.lsp.start(vim.lsp.config[server])
		end
	end,
}
