return {
    "lervag/vimtex",
	lazy = false,
    init = function()
    	vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_mappings_prefix = "<localleader>x"
		vim.g.vimtex_quickfix_ignore_filters = {
      		'Overfull',
			'Underfull',
			-- this error is just useless
			'/m/up',
			'Package pgf Warning: Returning node center instead of a point on node border.',
		}
    end,
  }
