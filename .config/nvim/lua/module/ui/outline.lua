return {
	plugins = {
		{
			"stevearc/aerial.nvim",
			lazy = true,
			keys = {
				{ "<leader>co", "<cmd>AerialToggle! left<cr>", desc = "Code outline" },
			},
			cmd = { "AerialToggle" },
			opts = {
				on_attach = function(bufnr)
					vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
				end,
			},
			-- Optional dependencies
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-tree/nvim-web-devicons",
			},
		},
	},
}
