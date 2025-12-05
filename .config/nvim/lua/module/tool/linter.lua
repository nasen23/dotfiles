return {
	plugins = {
		{
			"mfussenegger/nvim-lint",
			event = "LazyFile",
			config = function()
				local lint = require("lint")

				local desired_linters = {
					python = { "ruff" },
					lua = { "luacheck" },
				}

				local linters_by_ft = {}
				for filetype, executables in pairs(desired_linters) do
					linters_by_ft[filetype] = linters_by_ft[filetype] or {}

					for _, executable in ipairs(executables) do
						-- Check if the executable exists in the system PATH
						if vim.fn.executable(executable) == 1 then
							table.insert(linters_by_ft[filetype], executable)
						end
					end
				end

				lint.linters_by_ft = linters_by_ft
				vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
					callback = function()
						lint.try_lint()
					end,
				})
			end,
		},
	},
}
