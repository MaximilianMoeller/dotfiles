return {
	"lervag/vimtex",
	lazy = false,
	-- uses ‘init’ instead of ‘opts’, because it predates lua in nvim
	-- therefore all configuration has to be done by calling the old vimscript api (through lua though)
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_mappings_prefix = "<localleader>x"

		-- vimtex comes with its own (very basic) snippets. disable them
		vim.g.vimtex_imaps_enabled = 0
		vim.g.vimtex_quickfix_ignore_filters = {
			'Overfull',
			'Underfull',
			'Neither package',
		}
	end,
	keys = function()
		return {
			{ "<leader>x?", '<Plug>(vimtex-doc-package)', ft = "tex", desc = "Show LaTeX package documentation" }
		}
	end,
}
