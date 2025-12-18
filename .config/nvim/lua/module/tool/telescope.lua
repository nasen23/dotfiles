return {
	plugins = {
		{
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			keys = {
				{ "<leader>ff", "<cmd>Telescope file_browser path=%:p:h<CR>", desc = "Find files" },
				{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find files in project" },
				{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Find recent files" },
				{ "<leader>fP", "<cmd>Telescope find_files cwd=~/.config/nvim<CR>", desc = "Find config files" },
				{ "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
				{ "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Grep in project" },
				{
					"<leader>.",
					function()
						local builtin = require("telescope.builtin")
						local utils = require("telescope.utils")
						builtin.live_grep({ cwd = utils.buffer_dir() })
					end,
					desc = "Grep in current dir",
				},
				{ "<leader>pp", "<cmd>Telescope projects<CR>", desc = "Find projects" },
				{ "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
				{ "<leader>si", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Jump to symbol" },
				{
					"<leader>cj",
					"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
					desc = "Jump to symbol in current workspace",
				},
				{ "<m-x>", "<cmd>Telescope commands<CR>", desc = "Command" },
			},
			dependencies = {
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-project.nvim",
			},
			config = function()
				local telescope = require("telescope")
				telescope.setup({
					defaults = {
						mappings = {
							i = {
								["<C-h>"] = "which_key",
							},
						},
						-- layout_strategy = "bottom_pane",
						-- layout_config = {
						-- 	height = 0.4,
						-- },
						border = true,
						sorting_strategy = "ascending",
					},
					extensions = {
						file_browser = {
							theme = "dropdown",
							-- hijack_netrw = true,
						},
					},
				})
				telescope.load_extension("project")
				telescope.load_extension("file_browser")
			end,
		},
	},
}
