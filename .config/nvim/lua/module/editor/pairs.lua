local user = require("nsnvim.user")

return {
	plugins = {
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "BufWinEnter",
			config = function()
				require("nvim-surround").setup({})
			end,
		},
		{
			"windwp/nvim-autopairs",
			lazy = true,
			event = "InsertEnter",
			config = function()
				local npairs = require("nvim-autopairs")

				npairs.setup({
					check_ts = true,
					disable_filetype = { "TelescopePrompt", "spectre_panel", "markdown" },
					-- -- enable_check_bracket_line = true,
				})

				local Rule = require("nvim-autopairs.rule")

				local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
				npairs.add_rules({
					Rule(" ", " "):with_pair(function(opts)
						local pair = opts.line:sub(opts.col - 1, opts.col)
						return vim.tbl_contains({
							brackets[1][1] .. brackets[1][2],
							brackets[2][1] .. brackets[2][2],
							brackets[3][1] .. brackets[3][2],
						}, pair)
					end),
				})
				for _, bracket in pairs(brackets) do
					npairs.add_rules({
						Rule(bracket[1] .. " ", " " .. bracket[2])
							:with_pair(function()
								return false
							end)
							:with_move(function(opts)
								return opts.prev_char:match(".%" .. bracket[2]) ~= nil
							end)
							:use_key(bracket[2]),
					})
				end

				if user.module("editor.completion") then
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					local cmp = require("cmp")
					cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
				end
			end,
		},
	},
}
