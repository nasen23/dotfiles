return {
	plugins = {
		{
			"pocco81/auto-save.nvim",
			lazy = true,
			event = { "InsertLeave" },
			opts = {
				trigger_events = { "InsertLeave" },
			},
		},
	},
}
