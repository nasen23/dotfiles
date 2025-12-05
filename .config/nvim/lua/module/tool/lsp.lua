local util = vim.lsp.util

local function hover()
	vim.lsp.buf_request(0, "textDocument/hover", util.make_position_params(), function(_, result, context, config)
		config = config or {}
		config.focus_id = context.method
		if not (result and result.contents) then
			return
		end
		local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
		markdown_lines = util.trim_empty_lines(markdown_lines)
		if vim.tbl_isempty(markdown_lines) then
			return
		end

		vim.api.nvim_command([[ new ]])
		vim.api.nvim_buf_set_lines(0, 0, 1, false, markdown_lines)
		local win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_height(win, 15)
		vim.api.nvim_command([[ setlocal ft=markdown ]])
		vim.api.nvim_command([[ nnoremap <buffer>q <C-W>c ]])
		vim.api.nvim_command([[ setlocal buftype+=nofile ]])
		vim.api.nvim_command([[ setlocal nobl ]])
		vim.api.nvim_command([[ setlocal conceallevel=1 ]])
	end)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "K", hover, { buffer = bufnr })
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[e", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]e", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
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

local function on_attach(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_diagnostics(bufnr)
end

--  diagnostics = {
--   Error = " ",
--   Warn  = " ",
--   Hint  = " ",
--   Info  = " ",
-- },

return {
	plugins = {
		{
			"neovim/nvim-lspconfig",
			event = "LazyFile",
			config = function()
				local diagnostics = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				}
				for name, icon in pairs(diagnostics) do
					name = "DiagnosticSign" .. name
					vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
				end
				vim.diagnostic.config({
					virtual_text = false,
					update_in_insert = false,
					underline = true,
					severity_sort = true,
					float = {
						focusable = false,
						-- border = "rounded",
						source = "always",
						style = "minimal",
						header = "",
						prefix = "",
					},
				})
				vim.o.updatetime = 250
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					width = 60,
					focusable = false,
				})
				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					width = 60,
				})
			end,
		},
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({})
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		{
			"kosayoda/nvim-lightbulb",
			dependencies = { "antoinemadec/FixCursorHold.nvim" },
			event = "BufRead",
			config = function()
				require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
			end,
		},
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
			event = "LazyFile",
			config = function()
				require("fidget").setup({})
			end,
		},
	},
	fn = {
		on_attach = on_attach,
		register_lsp = function(lsp, config)
			vim.lsp.config("*", {
				on_attach = on_attach,
				settings = config,
			})
			require("fidget").setup({})
		end,
	},
}
