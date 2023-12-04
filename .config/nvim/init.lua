require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.trim")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("core.plugin").lazy_file()

-- Use a protected call so we don't error out on first use
local lazy = require("lazy")
local modules = require("user").modules
local user_config = require("user.config")
local lazy_plugins = {}
local config_fn = {}

for _, module_opts in pairs(modules) do
	local path, opts
	if type(module_opts) == "table" then
		path = module_opts[1]
		module_opts[1] = nil
		opts = module_opts
	else
		path = module_opts
	end
	opts = opts or {}

	local module = require("module." .. path)
	local plugins
	if type(module.plugins) == "function" then
		plugins = module.plugins(opts, user_config.opts)
	else
		plugins = module.plugins
	end
	-- Run config
	if module.config ~= nil then
		table.insert(config_fn, module.config)
	end
	if plugins ~= nil then
		vim.list_extend(lazy_plugins, plugins, nil, nil)
	end
end

lazy.setup(lazy_plugins)
for _, fn in pairs(config_fn) do
	fn()
end

if user_config.after_load ~= nil then
	user_config.after_load()
end
