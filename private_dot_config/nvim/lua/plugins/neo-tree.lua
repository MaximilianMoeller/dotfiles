return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",		-- some lua functions the authors of neo-tree used
		"MunifTanjim/nui.nvim",			-- UI Component Library
		"nvim-tree/nvim-web-devicons", 	-- icons for the tree (neo-tree documentation says it’s not strictly required, but I *need* them)
	},
	opts = {
		close_if_last_window = true,
		add_blank_line_at_top = true,

		popup_border_style = "rounded",
		source_selector = {
			winbar = true,
			statusline = false,
		},
		filesystem = {
			follow_current_file = { enabled = true },
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
			},
		},

		-- hides the cursor in neo-tree-windows
		-- somehow not working
		--event_handlers = {
		--	{
		--		event = "neo_tree_buffer_enter",
		--		handler = function()
		--			-- This effectively hides the cursor
		--			vim.cmd 'highlight! Cursor blend=100'
		--		end
		--	},
		--	{
		--		event = "neo_tree_buffer_leave",
		--		handler = function()
		--			-- Make this whatever your current Cursor highlight group is.
		--			vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
		--		end
		--	}
		--},
	},
	keys = {
		{"<leader>T", "<cmd>Neotree toggle show<CR>", desc = "Toggle File Explorer Visibility"},
		{"<leader>t",
			function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd.wincmd("p")
				else
					vim.cmd.Neotree("focus")
				end
			end,
			desc = "Toggle File Explorer Focus",
		},
	},
}
