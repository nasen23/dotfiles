return {
	plugins = {
		{
			"hrsh7th/nvim-cmp",
			event = { "InsertEnter", "CmdLineEnter" },
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")
				local defaults = require("cmp.config.default")()

				-- some other good icons
				local kind_icons = {
					Text = "󰦨 ",
					Method = "m ",
					Function = "󰊕 ",
					Constructor = " ",
					Field = " ",
					Variable = "󰫧 ",
					Class = " ",
					Interface = " ",
					Module = " ",
					Property = " ",
					Unit = " ",
					Value = " ",
					Enum = " ",
					Keyword = " ",
					Snippet = " ",
					Color = " ",
					File = " ",
					Reference = " ",
					Folder = " ",
					EnumMember = " ",
					Constant = "C ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
					Codeium = " ",
				}
				-- find more here: https://www.nerdfonts.com/cheat-sheet

				cmp.setup({
					completion = {
						completeopt = "menu,menuone,noinsert",
					},
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					formatting = {
						format = function(entry, item)
							item.kind = kind_icons[item.kind] .. item.kind
							return item
						end,
					},
					mapping = {
						["<C-p>"] = cmp.mapping.select_prev_item(),
						["<C-n>"] = cmp.mapping.select_next_item(),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-g>"] = cmp.mapping.close(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif luasnip.expand_or_locally_jumpable() then
								luasnip.expand_or_jump()
							else
								fallback()
							end
						end, {
							"i",
							"s",
						}),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, {
							"i",
							"s",
						}),
					},
					sources = {
						{ name = "nvim_lsp_signature_help" },
						{ name = "nvim_lsp", keyword_length = 1 },
						{ name = "nvim_lua", keyword_length = 1 },
						{ name = "luasnip", keyword_length = 2 },
						{ name = "buffer", keyword_length = 3 },
						{ name = "path" },
					},
					sorting = defaults.sorting,
				})
				cmp.setup.cmdline(":", {
					completion = {
						completeopt = "menu,menuone,noselect",
					},
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "cmdline" },
						{ name = "path" },
					},
				})
				cmp.setup.cmdline({ "/", "?" }, {
					completion = {
						completeopt = "menu,menuone,noselect",
					},
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})

				vim.api.nvim_create_autocmd("ModeChanged", {
					pattern = "*",
					callback = function()
						if
							(
								(vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n")
								or vim.v.event.old_mode == "i"
							)
							and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
							and not require("luasnip").session.jump_active
						then
							require("luasnip").unlink_current()
						end
					end,
				})
			end,
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"windwp/nvim-autopairs",
				"L3MON4D3/LuaSnip",
			},
		},
		{
			"L3MON4D3/LuaSnip",
			lazy = true,
			requires = "rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
}
