return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,

	opts = {
		highlight = { 
			enable = true,
			disable = { "latex" },
		},
		indent = {
			enable = true,
			disable = { "latex" },
		},
		ensure_installed = {
			-- for neovim
			"vim",
			"vimdoc",
			"lua",
			"luadoc",
			"luap",
			-- tools
			"json",
			"yaml",
			"toml",
			"diff",
			"regex",
			-- programming
			"bash",
			"c",
			"cpp",
			"python",
			-- writing
			"markdown",
			"markdown_inline",
			"latex",
			"bibtex",
		},
	},

	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
				end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
