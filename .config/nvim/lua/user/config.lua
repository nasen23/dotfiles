local M = {}

M.opts = {}

M.after_load = function()
	vim.cmd.colorscheme("catppuccin")
	vim.opt.cmdheight = 0
end

return M
