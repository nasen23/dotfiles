return {
	plugins = {
		{
			"simrat39/rust-tools.nvim",
			ft = { "rust" },
			config = function()
				local user = require("nsnvim.user")
				if user.module("tool.lsp") then
					require("module.tool.lsp").fn.register_lsp("rust_analyzer", {})
				end
				local rt = require("rust-tools")
				rt.setup({
					server = {
						on_attach = function(client, bufnr)
							local cb = require("module.tool.lsp").fn.on_attach
							cb(client, bufnr)
						end,
						settings = {
							["rust-analyzer"] = {
								cargo = {
									buildScripts = {
										enable = true,
									},
								},
								procMacro = {
									enable = true,
								},
								check = {
									allTargets = false,
								},
								checkOnSave = {
									command = "clippy",
								},
							},
						},
					},
				})
			end,
		},
	},
}
