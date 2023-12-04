return {
	plugins = {
		{
			"akinsho/bufferline.nvim",
			lazy = true,
			event = "LazyFile",
			keys = {
				{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
				{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			},
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				"catppuccin",
			},
			version = "*",
			config = function()
				require("bufferline").setup({
					highlights = require("catppuccin.groups.integrations.bufferline").get(),
					options = {
						always_show_bufferline = true,
						-- separator_style = "slant",
						offsets = {
							{
								filetype = "neo-tree",
								text = "Neo-tree",
								highlight = "Directory",
								text_align = "left",
							},
						},
					},
				})
			end,
		},
	},
}
