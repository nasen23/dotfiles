local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- File operations
vim.keymap.set("n", "<leader>fs", "<cmd>w<CR>", opts)

-- Better window navigation
vim.keymap.set("n", "<Leader>wh", "<C-w>h", opts)
vim.keymap.set("n", "<Leader>wj", "<C-w>j", opts)
vim.keymap.set("n", "<Leader>wk", "<C-w>k", opts)
vim.keymap.set("n", "<Leader>wl", "<C-w>l", opts)

vim.keymap.set("n", "<leader>wq", "<C-w>c", opts)
vim.keymap.set("n", "<leader>w=", "<C-w>=", opts)
vim.keymap.set("n", "<leader>ws", "<cmd>sp<CR>", opts)
vim.keymap.set("n", "<leader>wv", "<cmd>vs<CR>", opts)
for winum = 1, 7 do
	vim.keymap.set("n", "<leader>" .. winum, function()
		local win_id = vim.fn.win_getid(winum)
		vim.api.nvim_set_current_win(win_id)
	end, opts)
end

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
local function nav_buffer(n)
	local current = vim.api.nvim_get_current_buf()
	for i, v in ipairs(vim.t.bufs) do
		if current == v then
			vim.cmd.b(vim.t.bufs[(i + n - 1) % #vim.t.bufs + 1])
			break
		end
	end
end
vim.keymap.set("n", "]b", function()
	nav_buffer(1)
end, opts)
vim.keymap.set("n", "[b", function()
	nav_buffer(-1)
end, opts)

vim.keymap.set("n", "<leader>bk", "<cmd>Bdelete<CR>", opts)

-- Emacs
vim.keymap.set("i", "<c-f>", "<right>", opts)
vim.keymap.set("i", "<c-b>", "<left>", opts)
vim.keymap.set("i", "<c-p>", "<up>", opts)
vim.keymap.set("i", "<c-n>", "<down>", opts)
vim.keymap.set("i", "<c-a>", "<home>", opts)
vim.keymap.set("i", "<c-e>", "<end>", opts)
vim.keymap.set("i", "<c-k>", "<c-o>c$", opts)

vim.keymap.set("n", "<c-l>", "zz", opts)
vim.keymap.set("i", "<c-l>", "<c-o>zz", opts)

-- Borrowed from helix
vim.keymap.set({ "n", "v" }, "gh", "0", opts)
vim.keymap.set({ "n", "v" }, "gl", "$", opts)
vim.keymap.set({ "n", "v" }, "ge", "G", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
