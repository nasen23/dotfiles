local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function buf_is_valid(bufnr)
	if not bufnr then
		bufnr = 0
	end
	return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
end

local bufferline_group = augroup("bufferline", { clear = true })
autocmd({ "BufAdd", "BufEnter", "TabNewEntered" }, {
	desc = "Update buffers when adding new buffers",
	group = bufferline_group,
	callback = function(args)
		if not vim.t.bufs then
			vim.t.bufs = {}
		end
		if not buf_is_valid(args.buf) then
			return
		end
		local bufs = vim.t.bufs
		if not vim.tbl_contains(bufs, args.buf) then
			table.insert(bufs, args.buf)
			vim.t.bufs = bufs
		end
		vim.t.bufs = vim.tbl_filter(buf_is_valid, vim.t.bufs)
	end,
})
autocmd("BufDelete", {
	desc = "Update buffers when deleting buffers",
	group = bufferline_group,
	callback = function(args)
		for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
			local bufs = vim.t[tab].bufs
			if bufs then
				for i, bufnr in ipairs(bufs) do
					if bufnr == args.buf then
						table.remove(bufs, i)
						vim.t[tab].bufs = bufs
						break
					end
				end
			end
		end
		vim.t.bufs = vim.tbl_filter(buf_is_valid, vim.t.bufs)
		vim.cmd.redrawtabline()
	end,
})
