vim.opt.viewoptions:remove("curdir") -- disable saving current directory with views
vim.opt.shortmess:append({ s = true, I = true }) -- disable startup message
vim.opt.backspace:append({ "nostop" }) -- Don't stop backspace at insert
if vim.fn.has("nvim-0.9") == 1 then
	vim.opt.diffopt:append("linematch:60") -- enable linematch diff algorithm
end

local options = {
	breakindent = true, -- Wrap indent to match  line start
	clipboard = "unnamedplus", -- Connection to the system clipboard
	-- cmdheight = 1, -- hide command line unless needed
	completeopt = { "menu", "menuone", "noselect" }, -- Options for insert mode completion
	copyindent = true, -- Copy the previous indentation on autoindenting
	cursorline = false, -- Highlight the text line of the cursor
	expandtab = true, -- Enable the use of space in tab
	fileencoding = "utf-8", -- File content encoding for the buffer
	fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
	foldenable = true, -- enable fold for nvim-ufo
	foldlevel = 99, -- set high foldlevel for nvim-ufo
	foldlevelstart = 99, -- start with all code unfolded
	foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
	history = 100, -- Number of commands to remember in a history table
	ignorecase = true, -- Case insensitive searching
	infercase = true, -- Infer cases in keyword completion
	laststatus = 3, -- globalstatus
	linebreak = true, -- Wrap lines at 'breakat'
	mouse = "a", -- Enable mouse support
	number = true, -- Show numberline
	preserveindent = true, -- Preserve indent structure as much as possible
	pumheight = 10, -- Height of the pop up menu
	-- relativenumber = true, -- Show relative numberline
	scrolloff = 8, -- Number of lines to keep above and below the cursor
	shiftwidth = 2, -- Number of space inserted for indentation
	showmode = false, -- Disable showing modes in command line
	showtabline = 2,
	sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
	signcolumn = "yes", -- Always show the sign column
	smartcase = true, -- Case sensitivie searching
	splitbelow = true, -- Splitting a new window below the current one
	splitright = true, -- Splitting a new window at the right of the current one
	tabstop = 2, -- Number of space in a tab
	termguicolors = true, -- Enable 24-bit RGB color in the TUI
	timeoutlen = 500, -- Shorten key timeout length a little bit for which-key
	undofile = true, -- Enable persistent undo
	updatetime = 300, -- Length of time to wait before triggering the plugin
	virtualedit = "block", -- allow going past end of line in visual block mode
	wrap = false, -- Disable wrapping of lines longer than the width of window
	writebackup = false, -- Disable making a backup before overwriting a file
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

if vim.g.neovide then
	vim.o.guifont = "Hasklig:h13"
	vim.g.neovide_cursor_trail_size = 0.8

	vim.g.neovide_input_use_logo = 1
	vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
