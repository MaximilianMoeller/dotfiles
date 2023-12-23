return {
	"L3MON4D3/LuaSnip",
	opts = {
		history = true,
		delete_check_events = "TextChanged",
		update_events = {"TextChanged", "TextChangedI"}
	},
	keys = {
		{
			"<tab>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<tab>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<s-tab>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
		},
	},
	config = function()
		require("luasnip").config.setup {
			enable_autosnippets = true,
  			store_selection_keys = "<Tab>",
		}
	end,
}