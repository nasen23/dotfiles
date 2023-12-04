return {
	config = function()
		local user = require("nsnvim.user")
		if user.module("tool.lsp") then
			require("module.tool.lsp").fn.register_lsp("lua_ls", {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			})
		end
	end,
}
