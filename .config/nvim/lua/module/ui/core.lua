return {
	plugins = {
		{
			"kwkarlwang/bufresize.nvim",
			config = function()
				local opts = { noremap = true, silent = true }
				require("bufresize").setup({
					register = {
						keys = {
							{ "n", "<C-w><", "<C-w><", opts },
							{ "n", "<C-w>>", "<C-w>>", opts },
							{ "n", "<C-w>+", "<C-w>+", opts },
							{ "n", "<C-w>-", "<C-w>-", opts },
							{ "n", "<C-w>_", "<C-w>_", opts },
							{ "n", "<C-w>=", "<C-w>=", opts },
							{ "n", "<C-w>|", "<C-w>|", opts },
							{ "", "<LeftRelease>", "<LeftRelease>", opts },
							{ "i", "<LeftRelease>", "<LeftRelease><C-o>", opts },
						},
						trigger_events = { "BufWinEnter", "WinEnter" },
					},
					resize = {
						keys = {},
						trigger_events = { "VimResized" },
						increment = false,
					},
				})
			end,
		},
		-- {
		-- 	"mrjones2014/smart-splits.nvim",
		-- 	opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
		-- },
		{
			"stevearc/dressing.nvim",
			lazy = true,
			init = function()
				vim.ui.select = function(...)
					require("lazy").load({ plugins = { "dressing.nvim" } })
					return vim.ui.select(...)
				end
				vim.ui.input = function(...)
					require("lazy").load({ plugins = { "dressing.nvim" } })
					return vim.ui.input(...)
				end
			end,
		},
	},
}
