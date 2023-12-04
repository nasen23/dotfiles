return {
	plugins = {
		{
			"stevearc/conform.nvim",
			event = "BufWinEnter",
			keys = {
				{
					"<leader>cf",
					function()
						require("conform").format(nil, nil)
					end,
					desc = "Format buffer",
				},
			},
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						lua = { "stylua" },
						python = { { "ruff", "black" } },
					},
					format_on_save = function(bufnr)
						local ignore_filetypes = { "python" }
						if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
							return
						end
						return { timeout_ms = 700, quiet = true, lsp_fallback = false }
					end,
				})
			end,
		},
	},
	fn = {
		set_formatters_ft = function(ft, formatters)
			require("conform").formatters_by_ft[ft] = formatters
		end,
	},
}
