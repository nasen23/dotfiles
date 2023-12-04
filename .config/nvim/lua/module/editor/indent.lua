return {
	plugins = {
		{
			"nmac427/guess-indent.nvim",
			event = "BufWinEnter",
			config = function()
				require("guess-indent").setup({})
			end,
		},
	},
}
