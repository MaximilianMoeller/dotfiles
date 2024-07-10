return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim", -- some lua functions the authors of neo-tree used
		"MunifTanjim/nui.nvim",  -- UI Component Library
		"nvim-tree/nvim-web-devicons", -- icons for the tree (neo-tree documentation says it’s not strictly required, but I *need* them)
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
			follow_current_file = { enabled = false, leave_dirs_open = true },
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--              -- the current file is changed while the tree is open.
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			}
		},

		default_component_configs = {
			-- gruvbox colorscheme messes these up and uses DiagnosticSign<Severity>
			-- just overriding this in gruvbox would cause the Diagnostics in the SignColumn to have the wrong background
			-- this is the easiest fix
			diagnostics = {
				highlights = {
					hint = "DiagnosticHint",
					info = "DiagnosticInfo",
					warn = "DiagnosticWarn",
					error = "DiagnosticError",
				},
			}
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
		{ "<leader>T", "<cmd>Neotree toggle show<CR>", desc = "Toggle File Explorer Visibility" },
		{
			"<leader>t",
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
