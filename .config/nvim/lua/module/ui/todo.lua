return {
	plugins = {
		{
			"folke/todo-comments.nvim",
			cmd = { "TodoTrouble", "TodoTelescope" },
			event = "LazyFile",
			config = true,
		},
	},
}
