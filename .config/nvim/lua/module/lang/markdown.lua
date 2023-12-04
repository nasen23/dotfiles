return {
	plugins = {
		{
			"iamcco/markdown-preview.nvim",
			lazy = true,
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
		{
			"lukas-reineke/headlines.nvim",
			lazy = true,
			dependencies = "nvim-treesitter/nvim-treesitter",
			ft = { "markdown" },
			config = true, -- or `opts = {}`
		},
		{
			"jghauser/follow-md-links.nvim",
			lazy = true,
			ft = { "markdown" },
		},
	},
}
