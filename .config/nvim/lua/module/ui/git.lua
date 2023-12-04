return {
	plugins = {
		{
			"lewis6991/gitsigns.nvim",
			tag = "release",
			event = "BufRead",
			config = function()
				require("gitsigns").setup({})
			end,
		},
	},
}
