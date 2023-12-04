local user = require("nsnvim.user")

return {
	plugins = {
		{
			"TimUntersberger/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"sindrets/diffview.nvim",
			},
			keys = {
				{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
			},
			cmd = "Neogit",
			config = function()
				local neogit = require("neogit")
				local diffview = user.module("tool.diff")
				neogit.setup({
					use_magit_keybindings = true,
					integrations = {
						diffview = diffview,
					},
				})
			end,
		},
	},
}
