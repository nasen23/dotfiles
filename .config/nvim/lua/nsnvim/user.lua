local M = {}

local u = require("user.init")

local module_cache = nil
M.module = function(m)
	if module_cache == nil then
		module_cache = {}
		for _, module in pairs(u.modules) do
			if type(module) == "table" then
				module_cache[module[1]] = true
			elseif type(module) == "string" then
				module_cache[module] = true
			end
		end
	end
	return module_cache[m] ~= nil
end

return M
