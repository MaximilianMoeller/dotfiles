-- return {
--    "lervag/vimtex",
--    config = function()
--      vim.g.vimtex_view_view_method = 'zathura'
--	  vim.g.vimtex_mappings_prefix ='<localleader>x'
--    end,
--  }
return {
    "lervag/vimtex",
	lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
	  vim.g.vimtex_mappings_prefix = "<localleader>x"
      vim.g.vimtex_fold_enabled = 1
	vim.g.vimtex_quickfix_ignore_filters = {
      'Overfull',
      'Underfull',
	}
	vim.api.nvim_create_autocmd("User", {
      group = "vimtex",
      pattern = "VimtexEventQuit",
      command = "VimtexClean",
    })
    end,
  }
