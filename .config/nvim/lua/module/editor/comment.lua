return {
	plugins = {
		{
			"numToStr/Comment.nvim",
			event = "LazyFile",
			lazy = true,
			config = function()
				require("Comment").setup({})
			end,
		},
	},
}
