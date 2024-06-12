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
		auto_install = true,
	},
}
