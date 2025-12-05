return {
	plugins = {
		{
			"mfussenegger/nvim-lint",
			event = "LazyFile",
			config = function()
				local lint = require("lint")
				lint.linters_by_ft = {
					python = { "ruff" },
					lua = {},
				}
				if vim.fn.executable("luacheck") == 1 then
				  table.insert(lint.linters_by_ft.lua, "luacheck")
				end
				vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
					callback = function()
						lint.try_lint()
					end,
				})
			end,
		},
	},
}
