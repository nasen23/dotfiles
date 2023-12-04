return {
	plugins = {
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			keys = {
				{ "<leader>bi", "<cmd>Neotree source=buffers position=current<cr>", desc = "List Buffers" },
				{
					"<leader>fd",
					"<cmd>Neotree source=filesystem position=current dir=%:p:h<cr>",
					desc = "Open file browser",
				},
			},
			cmd = { "Neotree" },
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			},
		},
	},
}
