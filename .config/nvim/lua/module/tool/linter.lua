return {
	plugins = {
		{
			"mfussenegger/nvim-lint",
			event = "LazyFile",
			config = function()
				local lint = require("lint")
				lint.linters_by_ft = {
					python = { "ruff" },
					lua = { "luacheck" },
				}
				vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
					callback = function()
						lint.try_lint()
					end,
				})
			end,
		},
	},
}
