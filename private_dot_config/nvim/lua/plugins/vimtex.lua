return {
    "lervag/vimtex",
	lazy = false,
    init = function()
		-- syntax highlighting can be done by treesitter
    	vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_mappings_prefix = "<localleader>x"
		-- vimtex comes with its own (very basic) snippets. disable them
		vim.g.vimtex_imaps_enabled = 0
		vim.g.vimtex_quickfix_ignore_filters = {
      		'Overfull',
			'Underfull',
			-- this error is just useless
			--'/m/up',
			--'Package pgf Warning: Returning node center instead of a point on node border.',
			'Neither package',
		}
    end,
  }
