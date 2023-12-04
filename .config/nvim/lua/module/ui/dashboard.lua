return {
	plugins = {
		{
			"nvimdev/dashboard-nvim",
			event = "VimEnter",
			opts = function()
				local logo = {
					"                                                     ",
					"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
					"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
					"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
					"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
					"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
					"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
					"                                                     ",
				}

				local opts = {
					theme = "doom",
					hide = {
						statusline = false,
					},
					config = {
						header = logo,
						center = {
							{
								action = "Telescope file_browser path=%:p:h",
								desc = " Open file",
								icon = "",
								key = "f",
								keymap = "SPC ff",
								key_format = "",
							},
							{
								action = "Telescope oldfiles",
								desc = " Recently opened files",
								icon = "",
								key = "r",
								keymap = "SPC fr",
								key_format = "",
							},
							{
								action = "Telescope projects",
								desc = " Open project",
								icon = "",
								key = "p",
								keymap = "SPC pp",
								key_format = "",
							},
							{
								action = "Telescope find_files cwd=~/.config/nvim",
								desc = " Open config",
								icon = "",
								key = "P",
								keymap = "SPC fP",
								key_format = "",
							},
							{
								action = "qa",
								desc = " Quit",
								icon = "󰩈",
								key = "q",
								keymap = "q",
								key_format = "",
							},
						},
						footer = function()
							local stats = require("lazy").stats()
							local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
							return {
								"⚡ Neovim loaded "
									.. stats.loaded
									.. "/"
									.. stats.count
									.. " plugins in "
									.. ms
									.. "ms",
							}
						end,
					},
				}

				return opts
			end,
		},
	},
}
