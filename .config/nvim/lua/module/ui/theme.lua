return {
	plugins = {
		{
			"catppuccin/nvim",
			name = "catppuccin",
			version = "v1.3.0",
			config = function()
				require("catppuccin").setup({
					flavour = "frappe",
					-- transparent_background = true,
					integrations = {
						cmp = true,
						gitsigns = true,
						treesitter = true,
						dashboard = true,
						notify = true,
						telescope = {
							enabled = true,
						},
						leap = true,
						neogit = true,
						rainbow_delimiters = true,
						lsp_trouble = true,
						illuminate = true,
						native_lsp = {
							enabled = true,
							underlines = {
								errors = { "undercurl" },
								hints = { "undercurl" },
								warnings = { "undercurl" },
								information = { "undercurl" },
							},
							inlay_hints = {
								background = true,
							},
						},
					},
				})
			end,
		},
	},
}
