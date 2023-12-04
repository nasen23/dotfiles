local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover() vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[e", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]e", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>Format<CR>", opts)
end

local function lsp_diagnostics(bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local float_ops = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			}
			if not vim.b.diagnostic_pos then
				vim.b.diagnostic_pos = { nil, nil }
			end
			local cursor_pos = vim.api.nvim_win_get_cursor(0)
			if
				(cursor_pos[1] ~= vim.b.diagnostic_pos[1] or cursor_pos[2] ~= vim.b.diagnostic_pos[2])
				and #vim.diagnostic.get() > 0
			then
				vim.diagnostic.open_float({ scope = "cursor" }, float_ops)
			end
			vim.b.diagnostic_pos = cursor_pos
		end,
	})
end

return {
	on_attach = function(client, bufnr)
		lsp_keymaps(bufnr)
		lsp_diagnostics(bufnr)
	end,
}
