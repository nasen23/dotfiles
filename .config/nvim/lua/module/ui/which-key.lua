return {
	plugins = {
		{
			"folke/which-key.nvim",
			event = "BufWinEnter",
			config = function()
				require("which-key").setup({})
			end,
		},
	},
}
