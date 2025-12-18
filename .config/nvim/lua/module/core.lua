-- Core plugins

return {
	plugins = {
		"nvim-lua/plenary.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
		{
			"klen/nvim-config-local",
			config = function()
				require("config-local").setup({
					-- Default options (optional)

					-- Config file patterns to load (lua supported)
					config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

					-- Where the plugin keeps files data
					hashfile = vim.fn.stdpath("data") .. "/config-local",

					autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
					commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
					silent = false, -- Disable plugin messages (Config loaded/ignored)
					lookup_parents = false, -- Lookup config files in parent directories
				})
			end,
		},
		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
  		---@type snacks.Config
  		opts = {
    		-- your configuration comes here
    		-- or leave it empty to use the default settings
    		-- refer to the configuration section below
    		bigfile = { enabled = true },
    		-- dashboard = { enabled = true },
    		-- explorer = { enabled = true },
    		indent = { enabled = true },
    		input = { enabled = true },
    		-- picker = { enabled = true },
    		-- notifier = { enabled = true },
    		quickfile = { enabled = true },
    		scope = { enabled = true },
    		-- scroll = { enabled = true },
    		statuscolumn = { enabled = true },
    		words = { enabled = true },
  		},
		},
	},
}
