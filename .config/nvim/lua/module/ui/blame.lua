return {
	plugins = {
		{
			"FabijanZulj/blame.nvim",
			cmd = { "ToggleBlame", "EnableBlame" },
			config = function()
				require("blame").setup({
					merge_consecutive = true,
				})
			end,
		},
	},
}
