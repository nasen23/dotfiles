return {
	plugins = {
		{
			"FabijanZulj/blame.nvim",
			cmd = { "BlameToggle", "EnableBlame" },
			keys = {
				{ "<leader>gb", "<cmd>BlameToggle<CR>", desc = "Toggle git blame view" }
			},
			opts = {
				merge_consecutive = true,
			},
		},
	},
}
