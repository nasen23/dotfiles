local M = {}

M.modules = {
	"core",

	"ui.blame",
	"ui.color",
	"ui.core", -- dressing
	"ui.dashboard",
	"ui.git",
	"ui.highlight",
	"ui.outline",
	"ui.rainbow",
	"ui.statusline",
	"ui.tabs",
	{ "ui.theme.catppuccin", flavour = "frappe" },
	"ui.todo",
	"ui.which-key",

	"editor.buffer",
	"editor.comment",
	"editor.completion",
	"editor.indent",
	"editor.motion",
	"editor.pairs",

	"tool.diff",
	"tool.file-browser",
	"tool.format",
	"tool.git",
	"tool.linter",
	"tool.lsp",
	"tool.telescope",
	"tool.treesitter",

	"lang.cc",
	"lang.go",
	"lang.lua",
	"lang.markdown",
	"lang.python",
	"lang.rust",

	"app.wakatime",
}

return M
