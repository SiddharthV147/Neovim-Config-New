return {
	"saghen/blink.cmp",
	version = "^1",
	event = "InsertEnter",
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			nerd_font_variant = "mono",
			use_nvim_cmp_as_default = true,
		},
		completion = {
			documentation = { auto_show = false },
			menu = {
				auto_show = true,
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
