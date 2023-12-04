-- Highlight under cursor
local user = require("nsnvim.user")

return {
	plugins = {
		{
			"RRethy/vim-illuminate",
			event = "LazyFile",
			config = function()
				local illuminate = require("illuminate")
				local providers = {}
				if user.module("tool.lsp") then
					table.insert(providers, "lsp")
				end
				if user.module("tool.treesitter") then
					table.insert(providers, "treesitter")
				end
				if providers[1] == nil then
					table.insert(providers, "regex")
				end
				illuminate.configure({
					providers = providers,
					delay = 100,
					under_cursor = true,
					filetypes_denylist = {
						"alpha",
					},
				})
			end,
		},
	},
}
