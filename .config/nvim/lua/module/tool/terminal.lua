return {
	plugins = {
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			config = function()
				require("toggleterm").setup({
					open_mapping = [[<c-\>]],
				})
				function Set_term_keymaps()
					local opts = { buffer = 0 }
					vim.keymap.set("t", "<esc>", [[<c-\><c-n>]], opts)
				end

				vim.cmd([[autocmd! TermOpen term://*toggleterm#* lua Set_term_keymaps()]])
			end,
		},
	},
}
